const SearchError = error{NotFound};
pub const SearchType = enum { Linear, Binary };

pub fn search(elements: []const u64, searchElement: u64, searchType: SearchType) SearchError!usize {
    return switch (searchType) {
        .Linear => linearSearch(elements, searchElement),
        .Binary => binarySearch(elements, searchElement),
    };
}

fn linearSearch(elements: []const u64, searchElement: u64) SearchError!usize {
    for (elements, 0..) |element, index| {
        if (element == searchElement) {
            return index;
        }
    }
    return SearchError.NotFound;
}

fn binarySearch(elements: []const u64, searchElement: u64) SearchError!usize {
    var startIndex: usize = 0;
    var endIndex: usize = elements.len;
    var midpoint = (startIndex + endIndex) / 2;

    while (elements[midpoint] != searchElement and startIndex < endIndex) {
        if (elements[midpoint] < searchElement) {
            startIndex = midpoint + 1;
        } else {
            endIndex = midpoint - 1;
        }
        midpoint = (startIndex + endIndex) / 2;
    }

    if (elements[midpoint] != searchElement) {
        return SearchError.NotFound;
    }
    return midpoint;
}
