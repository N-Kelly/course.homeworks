import 'dart:async';

import 'models/waiter.dart';
import 'models/cook.dart';

void main() {
	StreamController<Map> ordersStreamController = new StreamController<Map>();

	Cook cook = Cook();
	Waiter waiter = Waiter(ordersStreamController);
	
	ordersStreamController.add({ 'action': 'doOrder', 'payload': { 'cook': cook, 'dish': 'test' } });
	Timer(Duration(seconds: 3), () => ordersStreamController.add({ 'action': 'doOrder', 'payload': { 'cook': cook, 'dish': 'test' } }));
	Timer(Duration(seconds: 5), () => ordersStreamController.add({ 'action': 'doOrder', 'payload': { 'cook': cook, 'dish': 'test' } }));
	Timer(Duration(seconds: 7), () => ordersStreamController.add({ 'action': 'doOrder', 'payload': { 'cook': cook, 'dish': 'test' } }));
	ordersStreamController.add({ 'action': 'test' });
}