import 'package:sprintf/sprintf.dart';

class GameRules {
	static const numberOfArmies = 2;
	static const armyAttackStrategy = 'random';
	static const numberOfSquadsPerArmy = 2;
	static const numberOfUnitsPerSquad = 2;
}

bool isGameRuleCorrect() => (
	GameRules.numberOfArmies >= 2 &&
	GameRules.armyAttackStrategy.startsWith(RegExp(r'^(random|weakest|strongest)+$')) &&
	GameRules.numberOfSquadsPerArmy >= 2 &&
	(GameRules.numberOfUnitsPerSquad >= 2 || GameRules.numberOfUnitsPerSquad <= 10)
);

void printCurrentGameRules() {
	print('|' + ''.padLeft(40, '—') + '|');
	print(sprintf("| %-38.38s |", ['CURRENT GAME RULES']));
	print('|' + ''.padLeft(40, '—') + '|');
	print(sprintf("| %-25.25s | %-10.10s |", ['Army attack strategy', GameRules.armyAttackStrategy]));
	print(sprintf("| %-25.25s | %-10.10s |", ['Number of armies', GameRules.numberOfArmies]));
	print(sprintf("| %-25.25s | %-10.10s |", ['Number of squads per army', GameRules.numberOfSquadsPerArmy]));
	print(sprintf("| %-25.25s | %-10.10s |", ['Number of units per squad', GameRules.numberOfUnitsPerSquad]));
	print('|' + ''.padLeft(40, '—') + '|');
}