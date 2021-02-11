import 'dart:math';

int random({ int min = 0, int max }) {
	return min + Random().nextInt(max - min);
}