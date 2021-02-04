import 'dart:io';
import 'package:args/args.dart';

import 'utils/defaultExtensions.dart';
import 'utils/files.dart';
import 'getSymbolsCount.dart';

void bindOptionsToFunctions(ArgParser p) {
	p.addOption('file');
	p.addFlag('cr', defaultsTo: false);
}

void main(List<String> args) {
	try {
		ArgParser argsParser = ArgParser();
		bindOptionsToFunctions(argsParser);
		ArgResults parsedArgs = argsParser.parse(args);

		final isConsiderRegistry = parsedArgs['cr'];
		final filePath = parsedArgs['file'];

		if(filePath != null) {
			final result = getSymbolsCount(
				getTextFromFile(filePath),
				isConsiderRegistry
			).format();
			print(result);
		} else {
			stdout.write('Please enter text:\n> ');
  			String text = stdin.readLineSync();
  			final result = getSymbolsCount(text, isConsiderRegistry).format();
  			print(result);
		}
	} catch(e) {
		print('[ERROR]: $e');
	}
}