import 'dart:math';

import '../utils/config.dart';
import 'Unit.dart';

class Squad {
	List<Unit> units;

	double get totalHealth => units.fold(0, (acc, unit) => acc + unit.health);

	bool get isActive => units.where((unit) => unit.isAlive).isNotEmpty;

	double get attack_success => pow(units.fold(1, (acc, unit) => acc * unit.attack_success), 1 / units.length);

	double get damage => units.fold(0, (acc, unit) => acc + unit.damage);

	int get countAliveUnits => units.where((unit) => unit.isAlive).length;

	void bringDamage(double totalDamage) {
		double damagePerPerson = totalDamage / this.countAliveUnits;
		units.forEach((unit) => unit.bringDamage(damagePerPerson));
	}

	Squad(this.units) {
		if(units.length != GameRules.numberOfUnitsPerSquad) {
			throw ('Can\'t create squad with ${units.length} unit(s)!');
		}
	}
}