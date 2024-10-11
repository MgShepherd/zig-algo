pub const sort_test = @import("sort_test.zig");
pub const search_test = @import("search_test.zig");

const std = @import("std");

test {
    std.testing.refAllDecls(@This());
}
