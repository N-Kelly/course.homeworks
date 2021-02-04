import 'utils/defaultExtensions.dart';

Map<String, int> getSymbolsCount(String text, bool isConsiderRegistry) {
	Map<String, int> data = <String, int>{};

	String tmpText = !isConsiderRegistry ? text.toLowerCase() : text;
	final words = tmpText.trim().clearText().getWords();
	
	if(words.length < 2)
		throw('The string is empty or contain only one word!');

	words.forEach((word) => (data[word] != null) ? data[word]++ : data[word] = 1);
	return data;
}