import '../utils/config.dart';
import '../utils/map_extensions.dart';
import '../utils/generate_name.dart';
import 'Squad.dart';

class Army {
	List<Squad> squads;
	String name = generateName();

	List<Squad> get activeSquads => [...squads..where((squad) => squad.isActive)..sort((first, second) => first.totalHealth.compareTo(second.totalHealth))];

	void attackSquad(Army enemyArmy) {
		if(GameRules.armyAttackStrategy == 'random') {
			var index = 0;
			for(Squad ownSquads in activeSquads) {
				if(enemyArmy.activeSquads.length == 0) break;
				ownSquads.attack(enemyArmy.activeSquads.getRandom());
			}
		} else if(GameRules.armyAttackStrategy == 'weakest') {

		} else if(GameRules.armyAttackStrategy == 'strongest') {

		}
	}

	Army(this.squads) {
		if(squads.length < GameRules.numberOfSquadsPerArmy) {
			throw ('Can\'t create army from ${squads.length} squad(s)!');
		}
	}
}