add_lunch_combo lineage_hermes-user
add_lunch_combo lineage_hermes-userdebug
add_lunch_combo lineage_hermes-eng

# Configure Jack
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

#hack
mkdir out
mkdir out/target
mkdir out/target/product
mkdir out/target/product/hermes
mkdir out/target/product/hermes/obj
mkdir out/target/product/hermes/obj/KERNEL_OBJ
mkdir out/target/product/hermes/obj/KERNEL_OBJ/usr
