import 'dart:async';
import 'dart:io';
import 'dart:convert';

class UserInput {
	String _data = '';
	Stream<String> _inputStream;
	StreamSubscription<String> _inputStreamController;
	int time;

	UserInput({ this.time }) {
		this._inputStream = stdin.transform(utf8.decoder);
	}

	void start() {
		print('Input text here. You have ${time} sec.\n');
		_inputStreamController = _inputStream.listen(_processLine);
		Timer(Duration(seconds: time), this._end);
	}

	void _processLine(String line) {
		if(line.trim() != '') _data += '${line}';
	}

	void _end() {
		_inputStreamController.cancel();
		print((_data.trim() != '') ? '\nCool! Look what we get.\n>> User input <<\n${_data}' : 'Bad :( User wrote nothing :(');
	}
}