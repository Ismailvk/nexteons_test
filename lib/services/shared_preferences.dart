import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._();
  static final _instance = SharedPreference._();
  static SharedPreference get instance => _instance;
  static const String token = 'token';

  late SharedPreferences sharedPref;

  initStorage() async => sharedPref = await SharedPreferences.getInstance();

  storeToken(loginToken) async => await sharedPref.setString(token, loginToken);

  removeToken() async => await sharedPref.remove(token);

  String? getToke() => sharedPref.getString(token);
}
