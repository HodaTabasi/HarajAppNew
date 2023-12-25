import 'package:get/get.dart';
import 'package:haraj/utils/models/offer/client_model.dart';

class ForgetPasswordResp {
  ForgetPasswordResp(
      {required this.status,
     });

  ForgetPasswordResp.fromJson(dynamic json) {
    status = json['status']?? false;
  }

  bool status = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    return map;
  }
}
