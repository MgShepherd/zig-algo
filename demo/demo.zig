const std = @import("std");
const sort = @import("sort");

pub fn main() void {
    const sorter = sort.Sorter(u8).create(sort.SortType.Bubble, compare);
    var elements = [_]u8{ 45, 23, 23, 12, 34, 21, 2, 33 };
    sorter.sort(&elements);
    std.debug.print("Sorted Elements: {any}\n", .{elements});
}

fn compare(item1: u8, item2: u8) sort.Ordering {
    if (item1 < item2) {
        return sort.Ordering.Before;
    } else if (item1 > item2) {
        return sort.Ordering.After;
    }
    return sort.Ordering.Equal;
}
