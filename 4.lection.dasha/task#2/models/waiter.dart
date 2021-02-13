import 'dart:async';
import 'cook.dart';

class Waiter {
	String dish;

	Waiter(StreamController<Map> ordersStreamController) {
		ordersStreamController.stream.listen((Map data) {
			if(data['action'] == 'doOrder') this._takeAndDoOrder(data['payload']['dish'], data['payload']['cook']);
			else print('[WAITER]: I don\'t know what me should do :(');
		});
	}

	void _takeAndDoOrder(String dish, Cook cook) {
		cook.startCook(dish);
	}
}