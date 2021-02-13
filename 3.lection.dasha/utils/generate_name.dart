import 'package:uuid/uuid.dart';

String generateName() {
	return Uuid().v4().replaceAll(RegExp('-'), '').substring(0, 8);
}