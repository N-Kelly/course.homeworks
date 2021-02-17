import 'dart:async';
import 'cook.dart';

class Waiter {
	String dish;
	StreamController<Map> _ordersStreamController;

	void _ordersStreamReduser(Map data) {
		final action = data['action'];
		final payload = data['payload'];

		switch(action) {
			case 'doOrder': payload['cook'].startCook(payload['dish']); break;
			default: print('[WAITER]: I don\'t know what me should do :(');
		}
	}

	void _initializeOrdersController() {
		_ordersStreamController.stream.listen(_ordersStreamReduser);
	}

	Waiter() {
		this._ordersStreamController = new StreamController<Map>();
		_initializeOrdersController();
	}

	void doOrder(String dish, Cook cook) => _ordersStreamController.add({ 'action': 'doOrder', 'payload': { 'cook': cook, 'dish': dish } });

}