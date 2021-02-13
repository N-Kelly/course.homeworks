import '../utils/config.dart';
import '../utils/actions_log_markers.dart';
import 'Army.dart';

class Battlefield {
	List<Army> armies;

	List<Army> get activeArmies => armies.where((army) => army.activeSquads.where((squad) => squad.isActive).length > 0).toList();
	bool get isArmiesActive => activeArmies.length > 1;
	
	void startFight() {

		while(isArmiesActive) {
			for(int i = 0; i < activeArmies.length; ++i) {
				for(int j = 0; j < activeArmies.length; ++j) {
					if(j == i) continue;
					print('\n' + ''.padLeft(50, '—') + '\nArmy [${activeArmies[i].name}] => Army [${activeArmies[j].name}]');
					activeArmies[i].attackSquad(activeArmies[j]);
				}
				print(''.padLeft(50, '—'));
			}
		}

		print('\n${ActionLogMarkers.winner(" > ")} Winner army#${activeArmies[0].name} ${ActionLogMarkers.winner(" < ")}');
	}

	Battlefield(this.armies) {
		if(armies.length < GameRules.numberOfArmies) {
			throw('Can\'t start fight with ${armies.length} army(ies)');
		}
	}
}