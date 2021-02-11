import '../utils/config.dart';
import 'Squad.dart';

class Army {
	List<Squad> squads;

	Army(this.squads) {
		if(squads.length < GameRules.numberOfSquadsPerArmy) {
			throw ('Can\'t create army from ${squads.length} squad(s)!');
		}
	}
}