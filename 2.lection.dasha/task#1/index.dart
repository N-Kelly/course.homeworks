import 'dart:io';
import 'package:args/args.dart';

import 'utils/map_format.dart';
import 'utils/files.dart';
import 'get_symbols_count.dart';

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
			);
			prettyPrint(result);
		} else {
			stdout.write('Please enter text:\n> ');
  			String text = stdin.readLineSync();
  			final result = getSymbolsCount(text, isConsiderRegistry);
  			prettyPrint(result);
		}
	} catch(e) {
		print('[ERROR]: $e');
	}
}