const search = @import("./search.zig");
const testing = @import("std").testing;

test "linear search should return the index of the requested element" {
    const elements = [_]u64{ 34, 23, 12, 4, 23, 8, 9 };
    const searchElement = 12;
    const expectedIndex = 2;

    const result = try search.search(&elements, searchElement, search.SearchType.Linear);

    try testing.expectEqual(expectedIndex, result);
}

test "linear search should return error if requested element does not exist" {
    const elements = [_]u64{ 34, 23, 12, 4, 23, 8, 9 };
    const searchElement = 14;

    const result = search.search(&elements, searchElement, search.SearchType.Linear);
    try testing.expectError(error.NotFound, result);
}

test "binary search should return correct index of element in a sorted list" {
    const elements = [_]u64{ 3, 7, 12, 45, 46, 73, 80, 100 };
    const searchElement = 80;
    const expectedIndex = 6;

    const result = search.search(&elements, searchElement, search.SearchType.Binary);
    try testing.expectEqual(expectedIndex, result);
}

test "binary search should return not found error if element does not exist" {
    const elements = [_]u64{ 3, 7, 12, 45, 46, 73, 80, 100 };
    const searchElement = 81;

    const result = search.search(&elements, searchElement, search.SearchType.Binary);
    try testing.expectError(error.NotFound, result);
}

test "search with timings should return index and duration if element exists" {
    const elements = [_]u64{ 3, 7, 12, 45, 46, 73, 80, 100 };
    const searchElement = 80;
    const expectedIndex = 6;

    const result = try search.searchWithTimings(&elements, searchElement, search.SearchType.Binary);
    try testing.expectEqual(expectedIndex, result.index);
    try testing.expect(result.duration >= 0);
}
