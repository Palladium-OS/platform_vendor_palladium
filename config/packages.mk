# Palladium packages
PRODUCT_PACKAGES += \
    GamingMode \
    ThemePicker \
    TouchGestures

# Palladium-OS UDFPS icon animations
EXTRA_UDFPS_ANIMATIONS ?= true
ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsResources
endif


# Extra tools in Palladium
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    zip

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync
