import '../utils/config.dart';

import 'Army.dart';

class Battlefield {
	List<Army> armies;

	Battlefield(this.armies) {
		if(armies.length < GameRules.numberOfArmies) {
			throw('Can\'t start fight with ${armies.length} army(ies)');
		}
	}
}