# path.mk
#
# Created on: 2013-12-24
#     Author: lenovo

## 目前的路径策略，根目录下建立out,bin,lib,src,build五大目录，out目录下可以再建立bin.lib,obj目录

PROJECT_OUT_PATH 		:= out
PROJECT_BIN_PATH 		:= bin
PROJECT_LIB_PATH 		:= lib

ifneq "$(TARGET_PRODUCT)" ""
  PRODUCT_SUFFIX 		:= $(TARGET_PRODUCT)
else
  PRODUCT_SUFFIX 		:= 
endif

ifdef ENABLE_PLATFORM_SUFFIX
ifneq "$(TARGET_PLATFORM)" ""
  PRODUCT_SUFFIX        := $(if $(PRODUCT_SUFFIX),$(PRODUCT_SUFFIX)-$(TARGET_PLATFORM),$(TARGET_PLATFORM))
endif
endif

## 产品和平台附加的路径后缀不为空，就以此建立子目录
ifneq "$(PRODUCT_SUFFIX)" ""
PRODUCT_OUT_PATH 		:= $(PROJECT_OUT_PATH)/$(PRODUCT_SUFFIX)
PRODUCT_BIN_PATH 		:= $(PROJECT_BIN_PATH)/$(PRODUCT_SUFFIX)
PRODUCT_LIB_PATH 		:= $(PROJECT_LIB_PATH)/$(PRODUCT_SUFFIX)
else
PRODUCT_OUT_PATH 		:= $(PROJECT_OUT_PATH)
PRODUCT_BIN_PATH 		:= $(PROJECT_BIN_PATH)
PRODUCT_LIB_PATH 		:= $(PROJECT_LIB_PATH)
endif

INSTALL_PATH 			:= $(PRODUCT_BIN_PATH)
INTERMEDIATE_PATH 		:= $(PRODUCT_OUT_PATH)
INTERMEDIATE_OBJ_PATH	:=$(INTERMEDIATE_PATH)/obj
INTERMEDIATE_LIB_PATH	:=$(INTERMEDIATE_PATH)/lib
INTERMEDIATE_BIN_PATH	:=$(INTERMEDIATE_PATH)/bin


