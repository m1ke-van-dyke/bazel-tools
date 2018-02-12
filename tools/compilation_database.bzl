def _impl(ctx):
    cppfrag = ctx.fragments.cpp
    print(cppfrag.c_options)

    ctx.actions.run_shell(
      outputs = [ctx.outputs.executable],
      command = "echo echo %s >> %s" % (cppfrag.c_options, ctx.outputs.executable.path),

      execution_requirements = {
        "no-sandbox": "1",
        "no-cache": "1",
        "no-remote": "1",
        "local": "1",
      },
    )


empty = rule(
    implementation=_impl,
    executable = True,
    fragments = ["cpp"],    
)

