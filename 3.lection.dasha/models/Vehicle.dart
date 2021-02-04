import 'dart:math';

import '../utils/defaultExtensions.dart';
import './Unit.dart';

class Vehicle extends Unit {
	List<Unit> operators;

	Vehicle(this.operators);

	double gavg() => this.operators.fold(0, (acc, operatorEntity) => acc + operatorEntity.attack_success) / this.operators.length;

	@override 
	double get attack_success => 0.5 * (1 + this.health / 100) * this.gavg();

	@override
	double get damage => 0.1 + this.operators.fold(0, (acc, operatorEntity) => operatorEntity.experience / 100);

	@override
	void bringDamage(double totalDamage) {
		this.health -= totalDamage * 0.6;
		this.operators.getRandom().bringDamage(totalDamage * 0.2);
		this.operators.forEach((operatorEntity) {
			operatorEntity.bringDamage(totalDamage * 0.2);
		});
	}
}