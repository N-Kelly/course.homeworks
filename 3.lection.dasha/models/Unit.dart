abstract class Unit {
	double health = 100;
	bool isAlive = true;

	double get attack_success;
	double get damage;

	void bringDamage(double totalDamage);
}