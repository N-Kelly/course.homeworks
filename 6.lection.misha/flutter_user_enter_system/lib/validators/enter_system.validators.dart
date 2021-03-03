String nameValidator(value) {
  String userName = value.trim().replaceAll('\\s+', '\\s');

  if (userName.isEmpty) {
    return 'Please, type your name!';
  } else if (userName.split(RegExp('\\s')).length > 1) {
    return 'Name have to contain 1 word!';
  } else if (!RegExp('\^[a-zA-Z]+\$').hasMatch(userName)) {
    return 'Name can contain only a-z symbols!';
  }

  return null;
}

String emailValidator(value) {
  String userEmail = value.trim().replaceAll('\\s+', '\\s');

  if (userEmail.isEmpty) {
    return 'Please, type your email!';
  } else if (userEmail.split(RegExp('\\s')).length > 1) {
    return 'Email have to contain 1 word!';
  } else if (!RegExp('\^[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+\$').hasMatch(userEmail)) {
    return 'Incorrect email!';
  }

  return null;
}

String phoneNumberValidator(value) {
  String userPhoneNumber = value.trim().replaceAll('\\s+', '\\s');

  if (userPhoneNumber.isEmpty) {
    return 'Please, type your phone number!';
  } else if (userPhoneNumber.split(RegExp('\\s')).length > 1) {
    return 'Phone number have to contain 1 word!';
  } else if (!RegExp('\^\\+?(38)?(0)?[0-9]{9}\$').hasMatch(userPhoneNumber)) {
    return 'Incorrect phone number!';
  }

  return null;
}

String passwordValidator(value) {
  String userPassword = value;

  if (userPassword.isEmpty) {
    return 'Please, type your password!';
  } else if (userPassword.split('').length < 7) {
    return 'Password must be more than 6 symbols!';
  }

  return null;
}
