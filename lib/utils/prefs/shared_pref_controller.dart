import 'package:haraj/utils/extensions/enums/enums.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  //SINGLETON DESIGN PATTERN

  static SharedPrefController? _instance;

  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  ///THIS IS METHOD FOR ADD DATA TO SharedPrefController

  Future<void> save({required UserModel user}) async {
    await _sharedPreferences.setBool(PrefKeys.login.toString(), true);
    await _sharedPreferences.setBool(PrefKeys.register.toString(), true);
    await _sharedPreferences.setInt(PrefKeys.type.toString(), user.data?.type ?? 0);
    await _sharedPreferences.setBool(PrefKeys.isVerify.toString(), user.data?.store!= null);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ${user.data?.token}');
  }


  //
  set isCompleteAddress(code) {
    _sharedPreferences.setBool(PrefKeys.isCompleteAddress.toString(), code);
  }
  bool get isCompleteAddress =>
      _sharedPreferences.getBool(PrefKeys.isCompleteAddress.toString()) ?? false;



  ///get user type
  int get type =>
      _sharedPreferences.getInt(PrefKeys.type.toString()) ?? 0;


//verify set get
  String get vierifyCode =>
      _sharedPreferences.getString(PrefKeys.verifyCode.toString()) ?? "";

  set vierifyCode(code) {
    _sharedPreferences.setString(PrefKeys.verifyCode.toString(), code);
  }

  ///THIS IS METHODS FOR GET DATA FROM SharedPrefController

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.login.toString()) ?? false;

  bool get register =>
      _sharedPreferences.getBool(PrefKeys.register.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  //Function To Edit language
  Future<bool> changeLanguage({required String language}) async {
    return await _sharedPreferences.setString(
        PrefKeys.language.toString(), language);
  }

  //Function To Read language
  String get language =>
      _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'ar';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
