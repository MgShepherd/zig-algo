const std = @import("std");
const algo = @import("algo");

pub fn main() void {
    const sorter = algo.Sorter(u8).create(algo.SortType.Bubble, compare);
    var elements = [_]u8{ 45, 23, 23, 12, 34, 21, 2, 33 };
    sorter.sort(&elements);
    std.debug.print("Sorted Elements: {any}\n", .{elements});
}

fn compare(item1: u8, item2: u8) algo.Ordering {
    if (item1 < item2) {
        return algo.Ordering.Before;
    } else if (item1 > item2) {
        return algo.Ordering.After;
    }
    return algo.Ordering.Equal;
}
