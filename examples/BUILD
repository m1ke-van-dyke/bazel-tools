load("//tools:command.bzl", "command")
load("//tools:individual.bzl", "individual")
load("//tools:compilation_database.bzl", "empty")


command(
	name = "format",
	command = "clang-format",
	arguments = ["-style=chromium"],
	srcs = glob(["**/*.*"])
)

individual(
	name = "format_indiv",
	command = "clang-format",
	arguments = ["-style=chromium"],
	srcs = glob(["**/*.*"])
)

empty(
	name = "test",
)
