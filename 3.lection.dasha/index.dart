import 'dart:convert';

import 'utils/config.dart';

void main() {
	GameRules gameRules = GameRules('./configs/general.json');
	print(
		gameRules.isCorrect() ?
		'Game can be start! Current rules => \n${JsonEncoder.withIndent('  ').convert(gameRules.currentConfig)}' :
		'Game can\'t be start! [config incorrect]'
	);
}