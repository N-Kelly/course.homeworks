import '../utils/config.dart';
import '../utils/map_extensions.dart';
import '../utils/generate_name.dart';
import 'Squad.dart';

class Army {
	List<Squad> squads;
	String name = generateName();

	List<Squad> get activeSquads {
		List<Squad> currentActiveSquads = squads..where((squad) => squad.isActive);
		currentActiveSquads.sort((first, second) => first.totalHealth.compareTo(second.totalHealth));
		return currentActiveSquads;
	}

	void attackEnemyOnStrategy(Squad ownSquads, Army enemyArmy) {
		switch(GameRules.armyAttackStrategy) {
			case 'random': ownSquads.attack(enemyArmy.activeSquads.getRandom()); break;
			case 'weakest': ownSquads.attack(enemyArmy.activeSquads.first); break;
			case 'strongest':ownSquads.attack(enemyArmy.activeSquads.last); break;
			default: ownSquads.attack(enemyArmy.activeSquads.getRandom()); break;
		}
	}

	void attackSquad(Army enemyArmy) {
		for(Squad ownSquads in activeSquads) {
			if(enemyArmy.activeSquads.length == 0) break;
			attackEnemyOnStrategy(ownSquads, enemyArmy);
		}
	}

	Army(this.squads) {
		if(squads.length < GameRules.numberOfSquadsPerArmy) {
			throw ('Can\'t create army from ${squads.length} squad(s)!');
		}
	}
}