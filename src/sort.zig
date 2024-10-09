const std = @import("std");

pub const SortType = enum { Bubble, Selection, Insertion };
pub const Ordering = enum { Before, Equal, After };

const CompareFunction = fn (item1: i32, item2: i32) Ordering;

pub fn sort(elements: []i32, sortType: SortType) void {
    processSort(elements, sortType, compareElements);
}

pub fn customSort(elements: []i32, sortType: SortType, comptime compareFn: CompareFunction) void {
    processSort(elements, sortType, compareFn);
}

fn processSort(elements: []i32, sortType: SortType, comptime compareFn: CompareFunction) void {
    switch (sortType) {
        .Bubble => bubbleSort(elements, compareFn),
        .Selection => selectionSort(elements, compareFn),
        .Insertion => insertionSort(elements, compareFn),
    }
}

fn bubbleSort(elements: []i32, comptime compareFn: CompareFunction) void {
    var i: usize = 0;
    while (i < elements.len - 1) : (i += 1) {
        var numSwaps: usize = 0;
        var j: usize = 0;
        while (j < elements.len - 1) : (j += 1) {
            if (compareFn(elements[j + 1], elements[j]) == Ordering.Before) {
                numSwaps += 1;
                swap(elements, j, j + 1);
            }
        }
        if (numSwaps == 0) break;
    }
}

fn selectionSort(elements: []i32, comptime compareFn: CompareFunction) void {
    var i: usize = 0;
    while (i < elements.len - 1) : (i += 1) {
        var j: usize = i + 1;
        var swapIndex: usize = i;
        while (j < elements.len) : (j += 1) {
            if (compareFn(elements[j], elements[swapIndex]) == Ordering.Before) {
                swapIndex = j;
            }
        }
        if (swapIndex != i) {
            swap(elements, i, swapIndex);
        }
    }
}

fn insertionSort(elements: []i32, comptime compareFn: CompareFunction) void {
    var i: usize = 1;
    while (i < elements.len) : (i += 1) {
        var j: usize = i;
        while (j > 0 and compareFn(elements[j - 1], elements[j]) == Ordering.After) : (j -= 1) {
            swap(elements, j, j - 1);
        }
    }
}

fn compareElements(item1: i32, item2: i32) Ordering {
    if (item1 < item2) {
        return Ordering.Before;
    } else if (item1 > item2) {
        return Ordering.After;
    }
    return Ordering.Equal;
}

fn swap(elements: []i32, index1: usize, index2: usize) void {
    elements[index1] = elements[index1] + elements[index2];
    elements[index2] = elements[index1] - elements[index2];
    elements[index1] = elements[index1] - elements[index2];
}
