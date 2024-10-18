# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FDEVICE="k71v1_64_bsp"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

# let's see what are our build VARs
# Initial Exports
	export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export LC_ALL="C"

# Version / Maintainer infos.
	export OF_MAINTAINER="Momo5418"
	export FOX_VERSION="R11.1"
	export FOX_BUILD_TYPE="Unofficial-Stable"

# Custom pic for the maintainer's info in about section
	export OF_MAINTAINER_AVATAR="/device/vivo/k71v1_64_bsp/Maintainer.png"
	
# Device Information.
	export FOX_ARCH=arm64
	export FOX_VARIANT="A10_FDE"
	export TARGET_DEVICE_ALT="PD1813" # I am not what are the over possible names.
    export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1

    # export OF_SKIP_FBE_DECRYPTION_SDKVERSION= 30
    export OF_DEFAULT_KEYMASTER_VERSION=3.0
    export OF_FLASHLIGHT_ENABLE=0

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
fi		
