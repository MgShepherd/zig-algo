const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const module = b.createModule(.{
        .root_source_file = b.path("src/sort.zig"),
    });

    const libsort = b.addSharedLibrary(.{
        .name = "algo",
        .root_source_file = b.path("src/algo.zig"),
        .target = target,
        .optimize = optimize,
        .version = .{ .major = 0, .minor = 1, .patch = 1 },
    });

    const demoexe = b.addExecutable(.{
        .name = "demo",
        .root_source_file = b.path("demo/demo.zig"),
        .target = target,
        .optimize = optimize,
    });

    demoexe.linkLibrary(libsort);
    demoexe.root_module.addImport("algo", module);

    const testStep = b.step("test", "Run unit tests");
    const unitTests = b.addTest(.{
        .root_source_file = b.path("src/algo_test.zig"),
        .target = b.resolveTargetQuery(.{}),
    });
    const runTests = b.addRunArtifact(unitTests);
    testStep.dependOn(&runTests.step);

    b.installArtifact(libsort);

    if (b.option(bool, "enable-demo", "install the library demo") orelse false) {
        b.installArtifact(demoexe);
    }
}
