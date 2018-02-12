load("//tools:run_command.bzl", "run_command")
load("//tools:run_individual.bzl", "run_individual")
load("//tools:compilation_database.bzl", "empty")


run_command(
	name = "format",
	command = "clang-format",
	arguments = ["-style=chromium"],
	srcs = glob(["**/*.*"])
)

run_individual(
	name = "format_indiv",
	command = "clang-format",
	arguments = ["-style=chromium"],
	srcs = glob(["**/*.*"])
)

empty(
	name = "test",
)
