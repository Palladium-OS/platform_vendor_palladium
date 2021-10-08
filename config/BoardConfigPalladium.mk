include vendor/palladium/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/palladium/config/BoardConfigQcom.mk
endif

include vendor/palladium/config/BoardConfigSoong.mk
