import 'dart:convert';

import 'utils/config.dart';
import 'start_game.dart';

void main() {
	if(isGameRuleCorrect()) {
		try {
			printCurrentGameRules();
			startGame();
		} catch(e) {
			print('[ERROR]: $e');
		}
	} else {
		print('Game can\'t be start! [config incorrect]');
	}
}