echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="build/make/core build/soong bionic frameworks/av frameworks/native system/core packages/apps/PackageInstaller packages/apps/Settings packages/inputmethods/LatinIME packages/services/Telephony"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/xiaomi/hermes/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
