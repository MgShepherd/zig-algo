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

test "should sort integer array using custom comparison function" {
    var elements = [_]i32{ 10, 3, 78, 34, 2 };
    const expectedElements = [_]i32{ 78, 34, 10, 3, 2 };

    inline for ([_]sorting.SortType{ .Bubble, .Selection, .Insertion }) |sortType| {
        sorting.customSort(&elements, sortType, customCompare);

        try testing.expectEqual(expectedElements, elements);
    }
}

fn customCompare(item1: i32, item2: i32) sorting.Ordering {
    if (item1 > item2) {
        return sorting.Ordering.Before;
    } else if (item1 < item2) {
        return sorting.Ordering.After;
    }
    return sorting.Ordering.Equal;
}
