#!/bin/bash
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NC="\033[0m"
if [ "$1" ]; then
    echo "Generating .json"
    file_path=$1
    file_name=$(basename $file_path)
    device_code=$(echo $file_name | cut -d'-' -f3)
    build_variant=$(echo $file_name | cut -d'-' -f5)
    num_version=$(echo $file_name | cut -d'-' -f2)
    if [ -f $file_path ]; then
        if [[ $file_name == *"OFFICIAL"* ]]; then # only generate for official builds
            file_size=$(stat -c%s $file_path)
            md5=$(cat "$file_path.md5sum" | cut -d' ' -f1)
            datetime=$(grep ro\.palladium\.build\.datetime ./out/target/product/${device_code}/system/build.prop | cut -d= -f2)
            id=$(sha256sum $file_path | awk '{ print $1 }')
            link="https://dump.palladiumos.com/${device_code}/${file_name}"
            echo "{" > $file_path.json
            echo "  \"response\": [" >> $file_path.json
            echo "    {" >> $file_path.json
            echo "     \"datetime\": ${datetime}," >> $file_path.json
            echo "     \"filename\": \"${file_name}\"," >> $file_path.json
            echo "     \"id\": \"${id}\"," >> $file_path.json
            echo "     \"romtype\": \"OFFICIAL\"," >> $file_path.json
            echo "     \"size\": ${file_size}," >> $file_path.json
            echo "     \"url\": \"${link}\"," >> $file_path.json
            echo "     \"version\": \"${num_version}\"" >> $file_path.json
            echo "    }" >> $file_path.json
            echo "  ]" >> $file_path.json
            echo "}" >> $file_path.json
            mv "${file_path}.json" "${OUT}/${device_code}_${build_variant}.json"
            echo -e "${GREEN}Done generating ${YELLOW}${device_code}_${build_variant}.json${NC}"
        else
            echo -e "${YELLOW}Skipped generating json for a non-official build${NC}"
        fi
    fi
fi