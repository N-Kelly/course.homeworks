import 'dart:math';

import '../utils/map_extensions.dart';
import '../utils/gavg.dart';
import 'Unit.dart';
import 'Soldier.dart';

class Vehicle extends Unit {
	List<Soldier> operators;
	Soldier driver;

	Vehicle(this.operators) {
		if(operators.length < 1 || operators.length > 3) throw('Ca\'nt create vehicle amount of operator(s) must be between 1 - 3!');
		this.health += operators.fold(0, (acc, operatorEntity) => acc + operatorEntity.health) / operators.length;
		this.driver = operators.getRandom();
	}

	double gavg() => pow(operators.fold(1, (acc, operatorEntity) => acc * operatorEntity.attack_success), 1 / operators.length);

	@override 
	double get attack_success => 0.5 * (1 + health / 100) * gavg();

	@override
	double get damage => 0.1 + operators.fold(0, (acc, operatorEntity) => operatorEntity.experience / 100);

	@override
	void bringDamage(double totalDamage) {
		if(isAlive) {
			health -= totalDamage * 0.6;
			Map excludedOperator = operators.getRandomWithIndex();

			excludedOperator['item'].bringDamage(totalDamage * 0.2);

			for(int i = 0; i < operators.length; i++) {
				if(i != excludedOperator['index']) {
					operators[i].bringDamage(totalDamage * (0.2 / operators.length));
				}
			}

			if(!driver.isAlive && health <= 0) {
				operators.forEach((operatorEntity) => operatorEntity.imedialtlyDie());
				isAlive = false;
			}
		}

	}
}