def _impl(ctx):
    cmd = ctx.attr.command
    args = " ".join(["%s" % (s) for s in ctx.attr.arguments])
    sources = " ".join(["$(realpath \"%s\")" % (f.path) for f in ctx.files.srcs])

    ctx.actions.run_shell(
      inputs = ctx.files.srcs,
      outputs = [ctx.outputs.executable],
      command = "echo %s %s %s >> %s" % (cmd, args, sources, ctx.outputs.executable.path),

      execution_requirements = {
        "no-sandbox": "1",
        "no-cache": "1",
        "no-remote": "1",
        "local": "1",
      },
    )

command = rule(
    implementation=_impl,
    executable=True,
    attrs={
      "command" : attr.string(),
      "arguments" : attr.string_list(allow_empty=True),
      "srcs": attr.label_list(allow_files=True, allow_empty=True),
    }
)
