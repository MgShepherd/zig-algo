const std = @import("std");
const algo = @import("algo");

pub fn main() void {
    inline for ([_]algo.SortType{ .Bubble, .Selection, .Insertion }) |sortType| {
        var elements = [_]u8{ 45, 23, 23, 12, 34, 21, 2, 33 };
        const sorter = algo.Sorter(u8).create(sortType, compare);
        const duration = sorter.sortWithTimings(&elements);
        std.debug.print("Algorithm: {any}, Sorted Elements: {any}, duration {d} nanoseconds\n", .{ sortType, elements, duration });
    }
}

fn compare(item1: u8, item2: u8) algo.Ordering {
    if (item1 < item2) {
        return algo.Ordering.Before;
    } else if (item1 > item2) {
        return algo.Ordering.After;
    }
    return algo.Ordering.Equal;
}
