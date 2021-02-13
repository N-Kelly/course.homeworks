import 'dart:async';

import '../utils/random.dart';

class Cook {
	bool isFree = true;
	String dish;

	Cook() {
		print('[COOK]: So, I\'m ready to cook!');
	}

	void startCook(String dish) {
		if(isFree) {
			isFree = false;
			print('[COOK]: I\'m start cooking! Please, don\'t disturb me!');
			Timer(Duration(seconds: random(min: 2, max: 5)), this._finishCook);
		} else {
			print('[COOK]: Don\'t disturb me, please! ~_~');
		}
	}

	void _finishCook() {
		isFree = true;
		print('[COOK]: Dish ready! I\'m wait new order!');
	}
}