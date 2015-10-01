MKELF := device/sony/nozomi/tools/mkelf.py
RPMBIN := vendor/sony/nozomi/proprietary/boot/RPM.bin

$(LOCAL_BUILT_MODULE): $(INSTALLED_KERNEL_TARGET) $(BOOT_RAMDISK) $(MKBOOTIMG) $(BOOTIMAGE_EXTRA_DEPS)
	@echo "Making hybris-boot.img in $(dir $@) using $(INSTALLED_KERNEL_TARGET) $(BOOT_RAMDISK)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@$(BOARD_KERNEL_ADDR) $(BOOT_RAMDISK)@$(BOARD_RAMDISK_ADDR),ramdisk $(RPMBIN)@$(BOARD_RPM_ADDR),rpm


