import 'dart:math';

int randomInt({ int min = 0, int max }) {
	return min + Random().nextInt(max - min);
}

String randomDegree() {
	return (Random().nextDouble() + randomInt(min: -40, max: 40)).toStringAsFixed(2);
}

String randomTime() {
	int randomNumber = randomInt(max: 23);
	int currentHour = (randomNumber > 12) ? (randomNumber - 12) : randomNumber;
	int currentMinutes = randomInt(max: 59);

	String hour = (currentHour < 10) ? "0${currentHour.toString()}" : "${currentHour.toString()}";
	String minutes = (currentMinutes < 10) ? "0${currentMinutes.toString()}" : "${currentMinutes.toString()}";
	String meridiem = "${randomNumber < 12 ? 'AM' : 'PM'}" ;

	return "$hour:$minutes $meridiem";
}