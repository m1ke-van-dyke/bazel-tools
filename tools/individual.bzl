def _impl(ctx):
    out = ctx.outputs.executable.path
    cmd = ctx.attr.command
    args = " ".join(["%s" % (s) for s in ctx.attr.arguments])
    complete = "\n".join(["echo %s %s $(realpath \"%s\") >> %s" % (cmd, args, f.path, out) for f in ctx.files.srcs])

    ctx.actions.run_shell(
      inputs = ctx.files.srcs,
      outputs = [ctx.outputs.executable],
      command = complete,

      execution_requirements = {
        "no-sandbox": "1",
        "no-cache": "1",
        "no-remote": "1",
        "local": "1",
      },
    )

individual = rule(
    implementation=_impl,
    executable=True,
    attrs={
      "command" : attr.string(),
      "arguments" : attr.string_list(allow_empty=True),
      "srcs": attr.label_list(allow_files=True, allow_empty=True),
    }
)
