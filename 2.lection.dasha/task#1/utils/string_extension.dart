extension CustomString on String {
	String clearText() {
		return this.replaceAll(RegExp('[^\\w\\s]'), '');
	}

	List getWords() {
		return this.split(RegExp('\\s+'));
	}
}