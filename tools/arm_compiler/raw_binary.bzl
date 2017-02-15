def _impl(ctx):
    output = ctx.outputs.out
    input = ctx.file.src
    objcopy = ctx.fragments.cpp.objcopy_executable

    ctx.action(
        inputs=[input],
        outputs=[output],
        progress_message="Creating raw binary from %s" % input.short_path,
        command="%s -O binary %s %s" % (objcopy, input.path, output.path))

raw_binary = rule(
    implementation=_impl,
    fragments=["cpp"],
    attrs={
        "src": attr.label(mandatory=True, allow_files=True, single_file=True),
    },
    outputs={"out": "%{name}.bin"},
)
