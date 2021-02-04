extension CustomList on List {
	List flat() {
		List result = [];

		this.forEach((item) => {
			(item is List) ?
			result = [...result, ...item.flat()] :
			result.add(item)
		});

		return result;
	}
}

void main() {
	final someData = const [[1], 2, [[3, 4], 5], [[[]]], [[[6]]], 7, 8, []];
	List flatedList = someData.flat();
	print(flatedList);
}