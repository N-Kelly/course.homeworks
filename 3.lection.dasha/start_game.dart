import 'utils/config.dart';
import 'models/Battlefield.dart';
import 'models/Army.dart';
import 'models/Squad.dart';
import 'models/Unit.dart';
import 'models/Soldier.dart';
import 'models/Vehicle.dart';

void startGame() {
	Battlefield mainBattlefield = Battlefield([
		Army([
			Squad([
				Soldier(),
				Soldier(),
			]),
			Squad([
				Soldier(),
				Soldier(),
			])
		]),
		Army([
			Squad([
				Soldier(),
				Soldier(),
			]),
			Squad([
				Soldier(),
				Soldier(),
			])
		])
	]);

	mainBattlefield.startFight();
}