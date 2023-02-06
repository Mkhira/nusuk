import 'package:queen_validators/queen_validators.dart';

class IsNumberClass extends TextValidationRule {
  const IsNumberClass([String? msg]) : super(msg);

  String get defaultError => 'numberValidation';

  @override
  bool isValid(String? val) => num.tryParse(val ?? '') != null;
}

class IsPhone extends TextValidationRule {
  const IsPhone([String? msg]) : super(msg);

  static RegExp regExp = RegExp(r'(^(?:[0]5)?[0-9]{10,12}$)');

  String get defaultError => 'phoneValidation';

  @override
  bool isValid(String? val) => regExp.hasMatch(val ?? '');
}

class IsPassword extends TextValidationRule {
  const IsPassword([String? msg]) : super(msg);
  @override
  String get defaultError => 'passwordValidation';

  @override
  bool isValid(String? val) => true;
}

class IsPassword2 extends TextValidationRule {
  const IsPassword2([String? msg]) : super(msg);

  // Minimum eight characters, at least one letter and one number
  // static RegExp regExp = RegExp(
  //   r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  // );
  // Minimum eight characters, at least one letter, one number and one special character
  // static RegExp regExp = RegExp(
  //   r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
  // );
  // Minimum eight characters, at least one uppercase letter, one lowercase letter and one number
  static RegExp regExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
  );
  // Minimum eight and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character
  // static RegExp regExp = RegExp(
  //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,8,10}$',
  // );
  // Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character
  // static RegExp regExp = RegExp(
  //   r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  // );
  @override
  String get defaultError => 'passwordValidation';
  @override
  bool isValid(String? val) => regExp.hasMatch(val ?? '');
  // bool isValid(String? val) => regExp.hasMatch(val ?? '');
}

class IsMatch extends TextValidationRule {
  const IsMatch(this.text, [String? msg]) : super(msg);
  final String text;
  @override
  String get defaultError => 'noMatch';
  @override
  bool isValid(String? val) => val == text;
  // bool isValid(String? val) => regExp.hasMatch(val ?? '');
}

class IsForbidden extends TextValidationRule {
  const IsForbidden(this.text, [String? msg]) : super(msg);
  final String text;
  @override
  String get defaultError => 'forbidden';
  @override
  bool isValid(String? val) => val != text;
  // bool isValid(String? val) => regExp.hasMatch(val ?? '');
}

class IsNotSpecialChars extends TextValidationRule {
  const IsNotSpecialChars(this.text, [String? msg]) : super(msg);
  final String text;

  static RegExp regExp = RegExp(
    // r'^[A-Za-z ]*$',
    // r'^[A-Za-z ]*$',
    // accept only letters and spaces in arabic and english
    r'^[A-Za-z\u0621-\u064A ]*$',
  );

  @override
  String get defaultError => 'noSpecialChars';
  @override
  bool isValid(String? val) => regExp.hasMatch(val ?? '');
  // bool isValid(String? val) => regExp.hasMatch(val ?? '');
}

class IsNumbersAndLetters extends TextValidationRule {
  const IsNumbersAndLetters(this.text, [String? msg]) : super(msg);

  final String text;

  @override
  String get defaultError => 'enterLettersAndNumbers';

  @override
  bool isValid(String? val) =>
      (val?.contains(RegExp(r'[a-zA-Z]')) ?? false) &&
      (val?.contains(RegExp('r[0-9]')) ?? false);
}
