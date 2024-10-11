const sorting = @import("./sort.zig");

const std = @import("std");
const testing = std.testing;

test "should sort i32 array" {
    var elements = [_]i32{ 10, 3, 78, 34, 2 };
    const expectedElements = [_]i32{ 2, 3, 10, 34, 78 };

    inline for ([_]sorting.SortType{ .Bubble, .Selection, .Insertion }) |sortType| {
        const sorter = sorting.Sorter(i32).create(sortType, customCompare);
        sorter.sort(&elements);

        try testing.expectEqual(expectedElements, elements);
    }
}

test "should sort u64 array" {
    var elements = [_]u64{ 10, 3, 78, 34, 2 };
    const expectedElements = [_]u64{ 2, 3, 10, 34, 78 };

    inline for ([_]sorting.SortType{ .Bubble, .Selection, .Insertion }) |sortType| {
        const sorter = sorting.Sorter(u64).create(sortType, customU64Compare);
        sorter.sort(&elements);

        try testing.expectEqual(expectedElements, elements);
    }
}

fn customCompare(item1: i32, item2: i32) sorting.Ordering {
    if (item1 < item2) {
        return sorting.Ordering.Before;
    } else if (item1 > item2) {
        return sorting.Ordering.After;
    }
    return sorting.Ordering.Equal;
}

fn customU64Compare(item1: u64, item2: u64) sorting.Ordering {
    if (item1 < item2) {
        return sorting.Ordering.Before;
    } else if (item1 > item2) {
        return sorting.Ordering.After;
    }
    return sorting.Ordering.Equal;
}
