const sorting = @import("./sort.zig");

const std = @import("std");
const testing = std.testing;

test "should sort integer array" {
    var elements = [_]i32{ 10, 3, 78, 34, 2 };
    const expectedElements = [_]i32{ 2, 3, 10, 34, 78 };

    inline for ([_]sorting.SortType{ .Bubble, .Selection, .Insertion }) |sortType| {
        sorting.sort(&elements, sortType);

        try testing.expectEqual(expectedElements, elements);
    }
}
