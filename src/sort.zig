const std = @import("std");

pub const SortType = enum { Bubble, Selection, Insertion };
pub const Ordering = enum { Before, Equal, After };

pub fn Sorter(comptime T: type) type {
    const CompareFn = fn (item1: T, item2: T) Ordering;

    return struct {
        compareFn: CompareFn,
        sortType: SortType,

        pub fn create(sortType: SortType, comptime compareFn: CompareFn) Sorter(T) {
            return .{ .compareFn = compareFn, .sortType = sortType };
        }

        pub fn sort(self: *const @This(), elements: []T, sortType: SortType) void {
            processSort(self, elements, sortType);
        }

        fn processSort(self: *const @This(), elements: []T, sortType: SortType) void {
            switch (sortType) {
                .Bubble => bubbleSort(self, elements),
                .Selection => selectionSort(self, elements),
                .Insertion => insertionSort(self, elements),
            }
        }

        fn bubbleSort(self: *const @This(), elements: []T) void {
            var i: usize = 0;
            while (i < elements.len - 1) : (i += 1) {
                var numSwaps: usize = 0;
                var j: usize = 0;
                while (j < elements.len - 1) : (j += 1) {
                    if (self.compareFn(elements[j + 1], elements[j]) == Ordering.Before) {
                        numSwaps += 1;
                        swap(elements, j, j + 1);
                    }
                }
                if (numSwaps == 0) break;
            }
        }

        fn selectionSort(self: *const @This(), elements: []T) void {
            var i: usize = 0;
            while (i < elements.len - 1) : (i += 1) {
                var j: usize = i + 1;
                var swapIndex: usize = i;
                while (j < elements.len) : (j += 1) {
                    if (self.compareFn(elements[j], elements[swapIndex]) == Ordering.Before) {
                        swapIndex = j;
                    }
                }
                if (swapIndex != i) {
                    swap(elements, i, swapIndex);
                }
            }
        }

        fn insertionSort(self: *const @This(), elements: []T) void {
            var i: usize = 1;
            while (i < elements.len) : (i += 1) {
                var j: usize = i;
                while (j > 0 and self.compareFn(elements[j - 1], elements[j]) == Ordering.After) : (j -= 1) {
                    swap(elements, j, j - 1);
                }
            }
        }

        fn swap(elements: []T, index1: usize, index2: usize) void {
            elements[index1] = elements[index1] + elements[index2];
            elements[index2] = elements[index1] - elements[index2];
            elements[index1] = elements[index1] - elements[index2];
        }
    };
}
