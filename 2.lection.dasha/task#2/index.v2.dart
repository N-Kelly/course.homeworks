import 'dart:convert';

List filterPersons(List persons) {
	List filleredData = [];

	persons.forEach((person) {
		if((person['age'] > 18) && (person['gender'] == 'man'))
			filleredData.add(person);
	});

	return filleredData;
}

void main() {
	List persons = json.decode('[{"firstName": "Rack", "lastName": "Jackon", "gender": "man", "age": 24}, {"firstName": "Dan", "lastName": "Smith", "gender": "man", "age": 16}, {"firstName": "Maria", "lastName": "Garcia", "gender": "woman", "age": 22}, {"firstName": "Robert", "lastName": "Smith", "gender": "man", "age": 45}, {"firstName": "Maria", "lastName": "Rodriguez", "gender": "woman", "age": 60}, {"firstName": "Mary", "lastName": "Smith", "gender": "woman", "age": 24}, {"firstName": "Maria", "lastName": "Hernandez", "gender": "woman", "age": 16}, {"firstName": "Katty", "lastName": "Williams", "gender": "woman", "age": 33}, {"firstName": "Nick", "lastName": "Johnson", "gender": "man", "age": 14}, {"firstName": "Steve", "lastName": "McClain", "gender": "man", "age": 17}, {"firstName": "Bob", "lastName": "Anderson", "gender": "man", "age": 75}]');
	List filteredPersons = filterPersons(persons);
	print(JsonEncoder.withIndent('  ').convert(filteredPersons));
}