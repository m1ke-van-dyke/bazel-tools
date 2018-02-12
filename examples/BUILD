load("//tools:run_command.bzl", "run_command")
load("//tools:compilation_database.bzl", "empty")


run_command(
	name = "format",
	command = "clang-format",
	arguments = ["-style=chromium"],
	srcs = glob(["**/*.*"])
)

empty(
	name = "test",
)
