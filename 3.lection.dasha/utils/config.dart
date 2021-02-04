import 'dart:io';
import 'dart:convert';

class GameRules {
	Map<String, dynamic> config;

	GameRules(String filepath) {
		if(File(filepath).absolute.existsSync())
			this.config = jsonDecode(File(filepath).absolute.readAsStringSync());
		else
			throw('File isn\'t exists!');
	}

	Map<String, dynamic> get currentConfig => this.config;

	bool isCorrect() => (
		this.config['numberOfArmies'] >= 2 &&
		this.config['armyAttackStrategy'].startsWith(RegExp(r'^(random|weakest|strongest)+$')) &&
		this.config['numberOfSquadsPerArmy'] >= 2 &&
		(this.config['numberOfUnitsPerSquad'] >= 5 || this.config['numberOfUnitsPerSquad'] <= 10)
	);

}