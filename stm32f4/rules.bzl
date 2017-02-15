SUPPORTED_PROCESSORS = [
    "STM32F429xx"
]

def arm_none_repository():
    native.new_http_archive(
        name = "com_arm_developer_toolchain_gcc_6_2",
        build_file = "compilers/arm_none_gcc_6.2.BUILD",
        strip_prefix = "gcc-arm-none-eabi-6_2-2016q4",
        url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2016q4/gcc-arm-none-eabi-6_2-2016q4-20161216-linux.tar.bz2"
    )

def _stm32f4_binary(ctx):
    my_copts = [ "-D" + ctx.file.processor ]
    hal_deps = []
    if (ctx.file.use_hal):
        my_copts.append("-DUSE_HAL_DRIVERS")
        if len(ctx.file.hal_config_hdrs) == 0:
            print("Error! missing hal_config_hdrs...")
            return False

        hal_deps.append("//Drivers/STM32F4xx_HAL_Driver/Inc:hal_headers")
        hal_deps.append(":hal_config_" + lower(ctx.file.name))
        native.cc_library(
            name = "hal_config_" + lower(ctx.file.name),
            hdrs = ctx.file.hal_config_hdrs,
            includes = [ "Inc/" ]
        )

    native.cc_library(
        name = "cmsis_device_stm32f4_" + lower(ctx.file.name),
        srcs = ["//Drivers/CMSIS/Device/ST/STM32F4xx:stm32f4_device_srcs"],
        deps = ["//Drivers/CMSIS/Device/ST/STM32F4xx/Include:cmsis_device_stm32f4_headers"],
        copts = my_copts,
        linkstatic = 1,
        deps = ["//Drivers/CMSIS/Include:cmsis_includes"] + hal_deps,
    )

    native.cc_library(
        name = "hal_" + lower(ctx.file.name),
        srcs = ["//Drivers/STM32F4xx_HAL_Driver/Src:hal_srcs"],
        deps = [":cmsis_device_stm32f4_" + lower(ctx.file.name)] + hal_deps,
        copts = my_copts
    )
 
def _stm32f4_library(ctx):
    print("library")


stm32f4_library = rule(
    implementation=_stm32f4_library,
    fragments=["cpp"],
    attrs = {
        "name" : attr.string(mandatory=True),
        "srcs" : attr.label_list(allow_files=True),
        "deps" : attr.label_list(allow_files=True),
        "processor" : attr.string(mandatory=True, values = SUPPORTED_PROCESSORS),
    }
)

stm32f4_binary = rule(
    implementation=_stm32f4_binary,
    fragments=["cpp"],
    attrs = {
        "name" : attr.string(mandatory=True),
        "srcs" : attr.label_list(allow_files=True),
        "deps" : attr.label_list(allow_files=True),
        "processor" : attr.string(mandatory=True, values = SUPPORTED_PROCESSORS),
        "use_hal": attr.bool(default=True),
        "hal_config_hdrs": attr.label_list(allow_files=True),
        "linker_script" : attr.label(mandatory=True, single_file=True)
    }
)
