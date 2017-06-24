USB_DEVICE_CLASS = {
		# "AUDIO/Inc/usbd_audio.h",
		# "AUDIO/Src/usbd_audio.c",
		# "CustomHID/Inc/usbd_customhid.h",
		# "CustomHID/Src/usbd_customhid.c",
		# "DFU/Inc/usbd_dfu.h",
		# "DFU/Src/usbd_dfu.c",
		# "HID/Inc/usbd_hid.h",
		# "HID/Src/usbd_hid.c",
		# "MSC/Inc/usbd_msc.h",
		# "MSC/Inc/usbd_msc_bot.h",
		# "MSC/Inc/usbd_msc_data.h",
		# "MSC/Inc/usbd_msc_scsi.h",
		# "MSC/Src/usbd_msc.c",
		# "MSC/Src/usbd_msc_bot.h",
		# "MSC/Src/usbd_msc_data.h",
		# "MSC/Src/usbd_msc_scsi.h",	
	'cdc': {
		'hdrs' : [
			"CDC/Inc/usbd_cdc.h",
		],
		'srcs' : [
			"CDC/Inc/usbd_cdc.c",
		],
	}
}

USB_DEVICE_CORE_HDRS = [
	"Inc/usbd_core.h",
	"Inc/usbd_ctlreq.h",
	"Inc/usbd_def.h",
	"Inc/usbd_ioreq.h",
]

USB_DEVICE_CORE_SOURCES = [
	"Src/usbd_core.c",
	"Src/usbd_ctlreq.c",
	"Src/usbd_ioreq.c",
]

def _strip_path_filename(path):
  """Returns the file name striped path"""
  last_pkg = path.rfind("/") + 1
  if last_pkg == 0:
    # Top-level BUILD file.
    return ""
  return path[last_pkg:]


def stm32_usb_device_library(name, srcs=[], hdrs=[], deps=[], usb_class=None, processor="STM32F407xx", include_path="Inc", **kwargs):
    my_copts = [ "-I" + include_path, "-D" + processor ]

    usb_srcs = []
    usb_srcs.extend(USB_DEVICE_CORE_SOURCES)
    usb_hdrs = []
    usb_hdrs.extend(USB_DEVICE_CORE_HDRS)
    usb_class_name = usb_class.lower()
    if usb_class_name in USB_DEVICE_CLASS.keys():
        usb_srcs.extend(USB_DEVICE_CLASS[usb_class_name]['srcs'])
        usb_hdrs.extend(USB_DEVICE_CLASS[usb_class_name]['hdrs'])
    else:
        print("HAL module: %s is not defined." % usb_class_name)

    native.genrule(
        name = "usb_device_" + name + "_" +  usb_class_name + "_srcs",
        srcs = [
        	str(Label("//Middlewares/ST/STM32_USB_Device_Library/Class:stm32_usb_device_class_sources")),
        	str(Label("//Middlewares/ST/STM32_USB_Device_Library/Core:stm32_usb_device_core_sources")),
        ],
        outs = ["stm32/usb_device/%s" % _strip_path_filename(src) for src in usb_srcs],
        cmd = "cp $(locations %s) $$(dirname $(location %s)); cp $(locations %s) $$(dirname $(location %s))" % (
        		str(Label("//Middlewares/ST/STM32_USB_Device_Library/Class:stm32_usb_device_class_sources")), 
        		"stm32/usb_device/usbd_core.c",
				str(Label("//Middlewares/ST/STM32_USB_Device_Library/Core:stm32_usb_device_core_sources")), 
        		"stm32/usb_device/usbd_core.c",
        		)
    )

    native.genrule(
        name = "usb_device_" + name + "_" +  usb_class_name + "_hdrs",
        srcs = [
        	str(Label("//Middlewares/ST/STM32_USB_Device_Library/Class:stm32_usb_device_class_sources")),
        	str(Label("//Middlewares/ST/STM32_USB_Device_Library/Core:stm32_usb_device_core_sources")),
        ],
        outs = ["stm32/usb_device/%s" % _strip_path_filename(src) for src in usb_hdrs],
        cmd = "cp $(locations %s) $$(dirname $(location %s)); cp $(locations %s) $$(dirname $(location %s))" % (
        		str(Label("//Middlewares/ST/STM32_USB_Device_Library/Class:stm32_usb_device_class_sources")), 
        		"stm32/usb_device/usbd_core.h",
				str(Label("//Middlewares/ST/STM32_USB_Device_Library/Core:stm32_usb_device_core_sources")), 
        		"stm32/usb_device/usbd_core.h",
        		)    
    )

    native.cc_library(
        name = name,
        srcs = [":usb_device_" + name + "_" +  usb_class_name + "_srcs"] + srcs,
        hdrs = [":usb_device_" + name + "_" +  usb_class_name + "_hdrs"] + hdrs,
        deps = deps,
        includes = ["stm32/usb_device"],
        copts = my_copts
    )