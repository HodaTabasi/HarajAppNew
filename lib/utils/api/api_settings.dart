class ApiSettings {
  //***************************MAIN LINK****************************************
  static const String _baseUrl = "http://haraj-online.com/";
  //***************************API LINK*****************************************
  static const String _apiUrl = "${_baseUrl}api";
  //***************************AUTH LINKS***************************************
  static const String login = '${_apiUrl}/login';
  static const String register = '${_apiUrl}/register';
  static const String verify = '${_apiUrl}/verify/{id}';
  static const String reSendVerify = '${_apiUrl}/resend-code';
  static const String socialLogin = '${_apiUrl}/social-login';
  static const String logout = '${_apiUrl}user/logout';
  static const String changeEmail = '${_apiUrl}user/change-email';
  static const String changePassword = '${_apiUrl}user/change-password';
  static const String deleteAccount = '${_apiUrl}user/delete';
  //***************************PROFILE LINKS************************************
  // static const String profile = '${_apiUrl}user/profile?user_id=';
  static const String getProfile = '${_apiUrl}/profile';
  static const String updatePersonalData = '${_apiUrl}/update-profile';
  static const String updateStoreData = '${_apiUrl}/update-store';
  //***************************GALLERY LINKS************************************
  static const String gallery = '${_apiUrl}user/gallery';
  //***************************FEATURES LINKS***********************************
  static const String governorates =
      '${_apiUrl}/governorates'; //المدن والمحافظات
  static const String updateAddress =
      '${_apiUrl}/update-address'; //المدن والمحافظات
  // ***************************POST LINKS**************************************
  static const String post = '${_apiUrl}/posts';
  // ***************************OFFERS LINKS************************************
  static const String offers = '${_apiUrl}/offers';
  // ***************************INSTRUCTION LINKS*******************************
  static const String instruction = '${_apiUrl}/instructions';
  // ***************************STORES LINKS************************************
  static const String stores = '${_apiUrl}/stores';
}
