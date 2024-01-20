#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_k71v1_64_bsp.mk

COMMON_LUNCH_CHOICES := \
    omni_k71v1_64_bsp-user \
    omni_k71v1_64_bsp-userdebug \
    omni_k71v1_64_bsp-eng
