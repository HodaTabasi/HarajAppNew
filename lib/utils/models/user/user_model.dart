class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String token;
  late String code;
  late String image;
  late String idNumber;
  late String nickName;
  late String status;
  late String emailVerifiedAt;
  late String canAddAd;
  late String canAddOffer;
  late bool isVerify;
  late String type;
  late String password;
  late String passwordConfirmation;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    code = json['code'];
    image = json['image'];
    idNumber = json['id_number'];
    nickName = json['nick_name'];
    type = json['type'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    canAddAd = json['can_add_ad'];
    canAddOffer = json['can_add_offer'];
    isVerify = json['is_verify'];
  }
}
