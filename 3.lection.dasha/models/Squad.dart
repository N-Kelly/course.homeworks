import 'dart:math';

import '../utils/config.dart';
import '../utils/map_extensions.dart';
import '../utils/generate_name.dart';
import '../utils/actions_log_markers.dart';
import 'Unit.dart';

class Squad {
	List<Unit> units;
	String name = generateName();

	double get totalHealth => units.fold(0, (acc, unit) => acc + unit.health);

	bool get isActive => units.where((unit) => unit.isAlive).isNotEmpty;

	double get attack_success => pow(units.fold(1, (acc, unit) => acc * unit.attack_success), 1 / units.length);

	double get damage => units.fold(0, (acc, unit) => acc + unit.damage);

	int get countAliveUnits => units.where((unit) => unit.isAlive).length;

	void attack(enemySquad) {
		if(attack_success > enemySquad.attack_success) {
			enemySquad.bringDamage(damage);
			print('${ActionLogMarkers.success(" > ")} squad#${name} successfully attacked squad#${enemySquad.name}');
		} else {
			print('${ActionLogMarkers.fail(" > ")} squad#${name} failed attack squad#${enemySquad.name}');
		}
	}

	void bringDamage(double totalDamage) {
		double damagePerPerson = totalDamage / countAliveUnits;
		units.forEach((unit) => unit.bringDamage(damagePerPerson));
	}

	Squad(this.units) {
		if(units.length != GameRules.numberOfUnitsPerSquad) {
			throw ('Can\'t create squad with ${units.length} unit(s)!');
		}
	}
}