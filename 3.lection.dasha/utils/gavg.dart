import 'dart:math';

double gavg(arr, field) {
	return pow(arr.fold(1, (acc, item) => acc * item[field]), 1 / arr.length);
}