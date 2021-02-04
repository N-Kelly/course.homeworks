import 'dart:convert';

void prettyPrint(Map m) {
	print(JsonEncoder.withIndent('  ').convert(m));
}