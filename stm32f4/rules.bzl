SUPPORTED_PROCESSORS = [
    "STM32F401xC",
    "STM32F401xE",
    "STM32F405xx",
    "STM32F407xx",
    "STM32F410Cx",
    "STM32F410Rx",
    "STM32F410Tx",
    "STM32F411xE",
    "STM32F412Cx",
    "STM32F412Rx",
    "STM32F412Vx",
    "STM32F412Zx",
    "STM32F413xx",
    "STM32F415xx",
    "STM32F417xx",
    "STM32F423xx",
    "STM32F427xx",
    "STM32F429xx",
    "STM32F437xx",
    "STM32F439xx",
    "STM32F446xx",
    "STM32F469xx",
    "STM32F479xx",
]

HAL_MODULES = {
    'HAL_ADC_SOURCES': [
        "stm32f4xx_hal_adc.c",
        "stm32f4xx_hal_adc_ex.c",  
        ],
    'HAL_CAN_SOURCES': [
        "stm32f4xx_hal_can.c",
    ],
    'HAL_CEC_SOURCES': [
        "stm32f4xx_hal_cec.c",
    ],
    'HAL_CRC_SOURCES': [
        "stm32f4xx_hal_crc.c",
    ],

    'HAL_CORTEX_SOURCES': [
        "stm32f4xx_hal_cortex.c",
    ],

    'HAL_CRYP_SOURCES': [
        "stm32f4xx_hal_cryp.c",
        "stm32f4xx_hal_cryp_ex.c",
    ],

    'HAL_DMA_SOURCES': [
        "stm32f4xx_hal_dma.c",
        "stm32f4xx_hal_dma_ex.c",
    ],

    'HAL_DMA2D_SOURCES': [
        "stm32f4xx_hal_dma2d.c",
    ],

    'HAL_FLASH_SOURCES': [
        "stm32f4xx_hal_flash.c",
        "stm32f4xx_hal_flash_ex.c",
        "stm32f4xx_hal_flash_ramfunc.c",
    ],

    'HAL_GPIO_SOURCES': [
        "stm32f4xx_hal_gpio.c",
    ],

    'HAL_HASH_SOURCES': [
        "stm32f4xx_hal_hash.c",
        "stm32f4xx_hal_hash_ex.c",
    ],


    'HAL_PDC_SOURCES': [
        "stm32f4xx_hal_pcd.c",
        "stm32f4xx_hal_pcd_ex.c",
    ],

    'HAL_PWR_SOURCES': [
        "stm32f4xx_hal_pwr.c",
        "stm32f4xx_hal_pwr_ex.c",
    ],

    'HAL_RCC_SOURCES': [
        "stm32f4xx_hal_rcc.c",
        "stm32f4xx_hal_rcc_ex.c",
    ],

    'HAL_RTC_SOURCES': [
        "stm32f4xx_hal_rtc.c",
        "stm32f4xx_hal_rtc_ex.c",
        "stm32f4xx_hal_timebase_rtc_alarm_template.c",
        "stm32f4xx_hal_timebase_rtc_wakeup_template.c",
    ],

    'HAL_TIM_SOURCES': [
        "stm32f4xx_hal_tim.c",
        "stm32f4xx_hal_tim_ex.c",
        "stm32f4xx_hal_timebase_tim_template.c",
    ],

    'HAL_UART_SOURCES': [
        "stm32f4xx_hal_uart.c",
    ],

    'HAL_LL_RCC_SOURCES': [
        "stm32f4xx_ll_rcc.c",
    ],

    'HAL_LL_USB_SOURCES': [
        "stm32f4xx_ll_usb.c",
    ],

    'HAL_LL_UTILS_SOURCES': [
        "stm32f4xx_ll_utils.c",
    ],
}

# HAL_SOURCES = [
#     
#     "stm32f4xx_hal_dac.c",
#     "stm32f4xx_hal_dac_ex.c",
#     "stm32f4xx_hal_dcmi.c",
#     "stm32f4xx_hal_dcmi_ex.c",
#     "stm32f4xx_hal_dfsdm.c",

#     "stm32f4xx_hal_dsi.c",
#     "stm32f4xx_hal_eth.c",

#     "stm32f4xx_hal_fmpi2c.c",
#     "stm32f4xx_hal_fmpi2c_ex.c",
#     

#     "stm32f4xx_hal_hcd.c",
#     "stm32f4xx_hal_i2c.c",
#     "stm32f4xx_hal_i2c_ex.c",
#     "stm32f4xx_hal_i2s.c",
#     "stm32f4xx_hal_i2s_ex.c",
#     "stm32f4xx_hal_irda.c",
#     "stm32f4xx_hal_iwdg.c",
#     "stm32f4xx_hal_lptim.c",
#     "stm32f4xx_hal_ltdc.c",
#     "stm32f4xx_hal_ltdc_ex.c",
#     "stm32f4xx_hal_mmc.c",
#     "stm32f4xx_hal_msp_template.c",
#     "stm32f4xx_hal_nand.c",
#     "stm32f4xx_hal_nor.c",
#     "stm32f4xx_hal_pccard.c",


#     "stm32f4xx_hal_qspi.c",

#     "stm32f4xx_hal_rng.c",
#     "stm32f4xx_hal_sai.c",
#     "stm32f4xx_hal_sai_ex.c",
#     "stm32f4xx_hal_sd.c",
#     "stm32f4xx_hal_sdram.c",
#     "stm32f4xx_hal_smartcard.c",
#     "stm32f4xx_hal_spdifrx.c",
#     "stm32f4xx_hal_spi.c",
#     "stm32f4xx_hal_sram.c",

#     
#     
#     "stm32f4xx_hal_usart.c",
#     "stm32f4xx_hal_wwdg.c",
#     "stm32f4xx_ll_fmc.c",
#     "stm32f4xx_ll_fsmc.c",
#     "stm32f4xx_ll_sdmmc.c",
#     
#     "stm32f4xx_ll_adc.c",
#     "stm32f4xx_ll_crc.c",
#     "stm32f4xx_ll_dac.c",
#     "stm32f4xx_ll_dma.c",
#     "stm32f4xx_ll_dma2d.c",
#     "stm32f4xx_ll_exti.c",
#     "stm32f4xx_ll_gpio.c",
#     "stm32f4xx_ll_i2c.c",
#     "stm32f4xx_ll_lptim.c",
#     "stm32f4xx_ll_pwr.c",
#     "stm32f4xx_ll_rng.c",
#     "stm32f4xx_ll_rtc.c",
#     "stm32f4xx_ll_spi.c",
#     "stm32f4xx_ll_tim.c",
#     "stm32f4xx_ll_usart.c",
# ]

def arm_none_repository(arch="linux"):
    if arch == "linux":
        native.new_http_archive(
            name = "com_arm_developer_toolchain_gcc_6_2",
            build_file = str(Label("//compilers:arm_none_gcc_6.2.BUILD")),
            strip_prefix = "gcc-arm-none-eabi-6-2017-q1-update",
            url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2"
            #url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2016q4/gcc-arm-none-eabi-6_2-2016q4-20161216-linux.tar.bz2"
        )
    if arch == "mac":
        native.new_http_archive(
            name = "com_arm_developer_toolchain_gcc_6_2",
            build_file = str(Label("//compilers:arm_none_gcc_6.2.BUILD")),
            strip_prefix = "gcc-arm-none-eabi-6_2-2016q4",
            url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2016q4/gcc-arm-none-eabi-6_2-2016q4-20161216-mac.tar.bz2"
        )

def stm32f4_hal_library(name, hdrs=[], modules=[], processor="STM32F407xx"):
    my_copts = [ "-IInc/", "-D" + processor ]
    hal_deps = []
    suffix = name.lower()
    hal_deps.append(str(Label("//Drivers/STM32F4xx_HAL_Driver/Inc:hal_headers")))
    hal_deps.append(":hal_config_" + suffix)
    native.cc_library(
        name = "hal_config_" + suffix,
        hdrs = hdrs,
        copts = [ "-IInc/" ]
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

    hal_sources = ["stm32f4xx_hal.c",]
    for module in modules:
        hal_module_name = "HAL_%s_SOURCES" % module.upper()
        if hal_module_name in HAL_MODULES.keys():
            hal_sources.extend(HAL_MODULES[hal_module_name])
        else:
            print("HAL module: %s is not defined." % hal_module_name)

    native.genrule(
        name = "hal_" + suffix + "_srcs",
        srcs = [str(Label("//Drivers/STM32F4xx_HAL_Driver/Src:hal_srcs"))],
        outs = ["stm32/hal/%s" % src for src in hal_sources],
        cmd = "cp $(locations %s) $$(dirname $(location %s))" % (str(Label("//Drivers/STM32F4xx_HAL_Driver/Src:hal_srcs")), "stm32/hal/stm32f4xx_hal.c")
    )

    native.cc_library(
        name = suffix,
        srcs = [":hal_" + suffix + "_srcs"],
        deps = [":cmsis_device_stm32f4_" + suffix] + hal_deps,
        copts = my_copts
    )


def stm32f4_binary(name, srcs = [], deps = [], processor = "STM32F429xx", use_hal=False,linker_script="", **kwargs):
    my_copts = [ "-D" + processor , "-IInc"]
    hal_deps = []
    suffix = name.lower()
    if (use_hal):
        my_copts.append("-DUSE_HAL_DRIVERS")

    native.cc_binary(
        name = name,
        srcs = srcs,
        deps = [linker_script] + deps,
        copts = my_copts,
        linkopts = ["-T " + linker_script, "-lc", "-lm", "-lnosys"],
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
