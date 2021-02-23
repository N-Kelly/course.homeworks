import 'random.dart';

extension CustomMap on List {
	T getRandom<T>() {
		return this[randomInt(max: this.length)];
	}
}