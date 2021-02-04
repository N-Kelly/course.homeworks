import 'dart:convert';

extension CustomMap on List {
	T getRandom() {
		return this[random(0, this.length];
	}
}