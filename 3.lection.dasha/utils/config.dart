class GameRules {
	static const numberOfArmies = 2;
	static const armyAttackStrategy = 'random';
	static const numberOfSquadsPerArmy = 2;
	static const numberOfUnitsPerSquad = 7;
}

bool isGameRuleCorrect() => (
	GameRules.numberOfArmies >= 2 &&
	GameRules.armyAttackStrategy.startsWith(RegExp(r'^(random|weakest|strongest)+$')) &&
	GameRules.numberOfSquadsPerArmy >= 2 &&
	(GameRules.numberOfUnitsPerSquad >= 5 || GameRules.numberOfUnitsPerSquad <= 10)
);

void printCurrentGameRules() => print('''
============================================
============ CURRENT GAME RULES ============
============================================
# Army attack strategy =>      ${GameRules.armyAttackStrategy}
# Number of armies =>          ${GameRules.numberOfArmies}
# Number of squads per army => ${GameRules.numberOfSquadsPerArmy}
# Number of units per squad => ${GameRules.numberOfUnitsPerSquad}
============================================\n
''');