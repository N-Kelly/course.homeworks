import 'dart:async';

import 'models/waiter.dart';
import 'models/cook.dart';

void main() {
	Cook cook = Cook();
	Waiter waiter = Waiter();
	
	waiter.doOrder('test1', cook);
	Timer(Duration(seconds: 3), () => waiter.doOrder('test2', cook));
	Timer(Duration(seconds: 5), () => waiter.doOrder('test3', cook));
	Timer(Duration(seconds: 7), () => waiter.doOrder('test4', cook));
	waiter.doOrder('test5', cook);
}