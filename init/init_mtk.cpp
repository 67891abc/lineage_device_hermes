#include <stdio.h>
#include <stdlib.h>
#include <sys/sysinfo.h>

#include <android-base/file.h>
#include <android-base/properties.h>
#include <android-base/strings.h>
#include <android-base/logging.h>

#include "property_service.h"

namespace android {
namespace init {

char const *heapminfree;
char const *heapmaxfree;
char const *heapstartsize;
char const *heapgrowthlimit;
char const *heapsize;

void init_alarm_boot_properties()
{
    char const *boot_mode_file = "/sys/devices/virtual/BOOT/BOOT/boot/boot_mode";
    std::string boot_mode;

    if (android::base::ReadFileToString(boot_mode_file, &boot_mode)) {
        if (android::base::Trim(boot_mode) == "7") {
            property_set("ro.alarm_boot", "true");
        }
    }
    else {
        LOG(ERROR) << "Unable to read boot_mode from " << boot_mode_file;
    }
}

void check_device()
{
    struct sysinfo sys;

    sysinfo(&sys);

    if (sys.totalram > 2048ull * 1024 * 1024) {
        // from - phone-xxxhdpi-3072-dalvik-heap.mk
        heapminfree = "512k";
        heapmaxfree = "8m";
	heapstartsize = "8m";
	heapgrowthlimit = "288m";
	heapsize = "768m";
    } else {
        // from - phone-xxhdpi-2048-dalvik-heap.mk
        heapminfree = "2m";
        heapmaxfree = "8m";
	heapstartsize = "16m";
	heapgrowthlimit = "192m";
	heapsize = "512m";
    }
}

void vendor_load_properties()
{
    LOG(INFO) << "Starting custom init";
    std::string platform;

    platform = android::base::GetProperty("ro.board.platform", "");
    if (platform != ANDROID_TARGET)
        return;

    check_device();

    property_set("dalvik.vm.heapstartsize", heapstartsize);
    property_set("dalvik.vm.heapgrowthlimit", heapgrowthlimit);
    property_set("dalvik.vm.heapsize", heapsize);
    property_set("dalvik.vm.heaptargetutilization", "0.75");
    property_set("dalvik.vm.heapminfree", heapminfree);
    property_set("dalvik.vm.heapmaxfree", heapmaxfree);

    init_alarm_boot_properties();
}

}  // namespace init
}  // namespace android
