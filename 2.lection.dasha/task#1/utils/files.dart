import 'dart:io';

String getTextFromFile(String path) {
	if(File(path).existsSync())
		return File(path).readAsStringSync();

	throw('File isn\'t exists!');
}