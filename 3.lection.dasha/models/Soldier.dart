import '../utils/random.dart';
import 'Unit.dart';

class Soldier extends Unit {
	int experience = 0;

	void experienceUp() => ++experience;

	@override 
	double get attack_success => 0.5 * (1 + health / 100) * random(min: 50 + experience, max: 100) / 100;

	@override
	double get damage => 0.05 + (experience / 100);

	@override
	void bringDamage(double totalDamage) {
		if(isAlive) {
			health -= totalDamage;
			if(health <= 0) isAlive = false;
		}
	}

	void imedialtlyDie() {
		health = 0;
		isAlive = false;
	}
}