import 'dart:math';

import 'Unit.dart';

class Soldier extends Unit {
	int experience = 0;

	void experienceUp() => this.experience++;

	@override 
	double get attack_success => 0.5 * (1 + this.health / 100) * random(50 + this.experience, 100) / 100;

	@override
	double get damage => 0.05 + this.experience / 100;

	@override
	void bringDamage(double totalDamage) => this.health -= totalDamage;
}