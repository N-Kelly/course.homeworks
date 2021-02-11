import 'dart:convert';
import 'dart:math';

import '../utils/random.dart';

extension CustomMap on List {
	Map getRandomWithIndex() {
		int randomItem = random(max: this.length);
		return {
			"index": randomItem,
			"item": this[randomItem]
		};
	}

	T getRandom<T>() {
		return this[random(max: this.length)];
	}
}