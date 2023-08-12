class ApiSettings {
  //***************************MAIN LINK****************************************
  static const String _baseUrl = "http://haraj-online.com/api/";
  //***************************API LINK*****************************************
  static const String _apiUrl = "${_baseUrl}api/";
  //***************************AUTH LINKS***************************************
  static const String login = '${_apiUrl}auth/login';
  static const String register = '${_apiUrl}auth/register';
  static const String logout = '${_apiUrl}user/logout';
  static const String verify = '${_apiUrl}auth/verify';
  static const String changeEmail = '${_apiUrl}user/change-email';
  static const String changePassword = '${_apiUrl}user/change-password';
  static const String deleteAccount = '${_apiUrl}user/delete';
  //***************************PROFILE LINKS************************************
  static const String profile = '${_apiUrl}user/profile?user_id=';
  static const String getProfile = '${_apiUrl}user/profile';
  static const String completeSellerProfile = '${_apiUrl}user/gallery';
  //***************************GALLERY LINKS************************************
  static const String gallery = '${_apiUrl}user/gallery';
  //***************************FEATURES LINKS***********************************
  static const String features = '${_apiUrl}features/{feature}';
}
