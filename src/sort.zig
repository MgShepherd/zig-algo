const std = @import("std");

pub const SortType = enum { Bubble, Selection, Insertion };

pub fn sort(elements: []i32, sortType: SortType) void {
    switch (sortType) {
        .Bubble => bubbleSort(elements),
        .Selection => selectionSort(elements),
        .Insertion => insertionSort(elements),
    }
}

fn bubbleSort(elements: []i32) void {
    var i: usize = 0;
    while (i < elements.len - 1) : (i += 1) {
        var numSwaps: usize = 0;
        var j: usize = 0;
        while (j < elements.len - 1) : (j += 1) {
            if (elements[j] > elements[j + 1]) {
                numSwaps += 1;
                swap(elements, j, j + 1);
            }
        }
        if (numSwaps == 0) break;
    }
}

fn selectionSort(elements: []i32) void {
    var i: usize = 0;
    while (i < elements.len - 1) : (i += 1) {
        var j: usize = i + 1;
        var minIndex: usize = i;
        while (j < elements.len) : (j += 1) {
            if (elements[j] < elements[minIndex]) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            swap(elements, i, minIndex);
        }
    }
}

fn insertionSort(elements: []i32) void {
    var i: usize = 1;
    while (i < elements.len) : (i += 1) {
        var j: usize = i;
        while (j > 0 and elements[j] < elements[j - 1]) : (j -= 1) {
            swap(elements, j, j - 1);
        }
    }
}

fn swap(elements: []i32, index1: usize, index2: usize) void {
    elements[index1] = elements[index1] + elements[index2];
    elements[index2] = elements[index1] - elements[index2];
    elements[index1] = elements[index1] - elements[index2];
}
