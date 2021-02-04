import 'utils/string_extension.dart';

Map<String, int> getSymbolsCount(String text, bool isConsiderRegistry) {
	Map<String, int> data = <String, int>{};

	String formatText = isConsiderRegistry ? text : text.toLowerCase();
	final words = formatText.trim().clearText().getWords();
	
	if(words.length < 2)
		throw('The string is empty or contain only one word!');

	words.forEach((word) => data.containsKey(word) ? data[word]++ : data[word] = 1);
	return data;
}