import 'package:ansicolor/ansicolor.dart';

class ActionLogMarkers {
	static final AnsiPen success = AnsiPen()..rgb(r: .255, g: .69, b: 0, bg: true)..white(bold: true);
	static final AnsiPen fail = AnsiPen()..red(bg: true)..white(bold: true);
	static final AnsiPen winner = AnsiPen()..rgb(r: 1.0, g: .5, b: 0, bg: true)..white(bold: true);
}