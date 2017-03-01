SUPPORTED_PROCESSORS = [
    "STM32F429xx",
]

HAL_SOURCES = [
        "stm32f4xx_hal.c",
        "stm32f4xx_hal_adc.c",
        "stm32f4xx_hal_adc_ex.c",
        "stm32f4xx_hal_can.c",
        "stm32f4xx_hal_cec.c",
        "stm32f4xx_hal_cortex.c",
        "stm32f4xx_hal_crc.c",
        "stm32f4xx_hal_cryp.c",
        "stm32f4xx_hal_cryp_ex.c",
        "stm32f4xx_hal_dac.c",
        "stm32f4xx_hal_dac_ex.c",
        "stm32f4xx_hal_dcmi.c",
        "stm32f4xx_hal_dcmi_ex.c",
        "stm32f4xx_hal_dfsdm.c",
        "stm32f4xx_hal_dma.c",
        "stm32f4xx_hal_dma2d.c",
        "stm32f4xx_hal_dma_ex.c",
        "stm32f4xx_hal_dsi.c",
        "stm32f4xx_hal_eth.c",
        "stm32f4xx_hal_flash.c",
        "stm32f4xx_hal_flash_ex.c",
        "stm32f4xx_hal_flash_ramfunc.c",
        "stm32f4xx_hal_fmpi2c.c",
        "stm32f4xx_hal_fmpi2c_ex.c",
        "stm32f4xx_hal_gpio.c",
        "stm32f4xx_hal_hash.c",
        "stm32f4xx_hal_hash_ex.c",
        "stm32f4xx_hal_hcd.c",
        "stm32f4xx_hal_i2c.c",
        "stm32f4xx_hal_i2c_ex.c",
        "stm32f4xx_hal_i2s.c",
        "stm32f4xx_hal_i2s_ex.c",
        "stm32f4xx_hal_irda.c",
        "stm32f4xx_hal_iwdg.c",
        "stm32f4xx_hal_lptim.c",
        "stm32f4xx_hal_ltdc.c",
        "stm32f4xx_hal_ltdc_ex.c",
        "stm32f4xx_hal_msp_template.c",
        "stm32f4xx_hal_nand.c",
        "stm32f4xx_hal_nor.c",
        "stm32f4xx_hal_pccard.c",
        "stm32f4xx_hal_pcd.c",
        "stm32f4xx_hal_pcd_ex.c",
        "stm32f4xx_hal_pwr.c",
        "stm32f4xx_hal_pwr_ex.c",
        "stm32f4xx_hal_qspi.c",
        "stm32f4xx_hal_rcc.c",
        "stm32f4xx_hal_rcc_ex.c",
        "stm32f4xx_hal_rng.c",
        "stm32f4xx_hal_rtc.c",
        "stm32f4xx_hal_rtc_ex.c",
        "stm32f4xx_hal_sai.c",
        "stm32f4xx_hal_sai_ex.c",
        "stm32f4xx_hal_sd.c",
        "stm32f4xx_hal_sdram.c",
        "stm32f4xx_hal_smartcard.c",
        "stm32f4xx_hal_spdifrx.c",
        "stm32f4xx_hal_spi.c",
        "stm32f4xx_hal_sram.c",
        "stm32f4xx_hal_tim.c",
        "stm32f4xx_hal_tim_ex.c",
        "stm32f4xx_hal_timebase_rtc_alarm_template.c",
        "stm32f4xx_hal_timebase_rtc_wakeup_template.c",
        "stm32f4xx_hal_timebase_tim_template.c",
        "stm32f4xx_hal_uart.c",
        "stm32f4xx_hal_usart.c",
        "stm32f4xx_hal_wwdg.c",
        "stm32f4xx_ll_fmc.c",
        "stm32f4xx_ll_fsmc.c",
        "stm32f4xx_ll_sdmmc.c",
        "stm32f4xx_ll_usb.c",
]

def arm_none_repository():
    native.new_http_archive(
        name = "com_arm_developer_toolchain_gcc_6_2",
        build_file = str(Label("//compilers:arm_none_gcc_6.2.BUILD")),
        strip_prefix = "gcc-arm-none-eabi-6_2-2016q4",
        url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2016q4/gcc-arm-none-eabi-6_2-2016q4-20161216-linux.tar.bz2"
    )

def stm32f4_binary(name, srcs = [], deps = [], processor = "STM32F429xx", use_hal=False, hal_config_hdrs = [],linker_script="", **kwargs):
    my_copts = [ "-D" + processor ]
    hal_deps = []
    suffix = name.lower()
    if (use_hal):
        my_copts.append("-DUSE_HAL_DRIVERS")
        if len(hal_config_hdrs) == 0:
            print("Error! missing hal_config_hdrs...")
            return False

        hal_deps.append(str(Label("//Drivers/STM32F4xx_HAL_Driver/Inc:hal_headers")))
        hal_deps.append(":hal_config_" + suffix)
        native.cc_library(
            name = "hal_config_" + suffix,
            hdrs = hal_config_hdrs,
            includes = [ "Inc/" ]
        )

    native.genrule(
        name = "stm32f4xx_system_source",
        srcs = [str(Label("//Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates:stm32f4xx_system_srcs"))],
        outs = ["stm32/src/system.c"],
        cmd = "cp $(<) $(@)",
    )

    native.cc_library(
        name = "cmsis_device_stm32f4_" + suffix,
        srcs = [":stm32f4xx_system_source"],
        deps = [
            str(Label("//Drivers/CMSIS/Device/ST/STM32F4xx/Include:cmsis_device_stm32f4_headers")), 
            str(Label("//Drivers/CMSIS/Include:cmsis_includes")),
            str(Label("//Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates:" + processor.lower() + "_startup"))] + hal_deps,
        copts = my_copts,
        linkstatic = 1,
    )

    native.genrule(
        name = "hal_" + suffix + "_srcs",
        srcs = [str(Label("//Drivers/STM32F4xx_HAL_Driver/Src:hal_srcs"))],
        outs = ["stm32/hal/%s" % src for src in HAL_SOURCES],
        cmd = "cp $(locations %s) $$(dirname $(location %s))" % (str(Label("//Drivers/STM32F4xx_HAL_Driver/Src:hal_srcs")), "stm32/hal/stm32f4xx_hal.c")
     )
    native.cc_library(
        name = "hal_" + suffix,
        srcs = [":hal_" + suffix + "_srcs"],
        deps = [":cmsis_device_stm32f4_" + suffix] + hal_deps,
        copts = my_copts
    )

    native.cc_binary(
        name = name,
        srcs = srcs,
        deps = [":hal_"+suffix, ":cmsis_device_stm32f4_"+suffix, linker_script] + deps,
        copts = my_copts,
        linkopts = ["-T " + linker_script],
        linkstatic = 1,
    )

    
 
def _stm32f4_library(ctx):
    print("library")


stm32f4_library = rule(
    implementation=_stm32f4_library,
    fragments=["cpp"],
    attrs = {
        "srcs" : attr.label_list(allow_files=True),
        "deps" : attr.label_list(allow_files=True),
        "processor" : attr.string(mandatory=True, values = SUPPORTED_PROCESSORS),
    })

#stm32f4_binary = rule(
#    implementation=_stm32f4_binary,
#    fragments=["cpp"],
#    attrs = {
#        "srcs" : attr.label_list(allow_files=True),
#        "deps" : attr.label_list(allow_files=True),
#        "processor" : attr.string(mandatory=True, values = SUPPORTED_PROCESSORS),
#        "use_hal": attr.bool(default=True),
#        "hal_config_hdrs": attr.label_list(allow_files=True),
#        "linker_script" : attr.label(mandatory=True, allow_single_file=True)
#    })
