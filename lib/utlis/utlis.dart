



class AppUtils {
String replaceArFaNumbersToEn(String input) {
const List<String> arabic = <String>['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
const List<String> farsi = <String>['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
const List<String> english = <String>['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

for (int i = 0; i < english.length; i++) {
input = input.replaceAll(arabic[i], english[i]);
input = input.replaceAll(farsi[i], english[i]);
}

return input;
}
}