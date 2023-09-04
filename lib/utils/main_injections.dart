import 'package:get/get.dart';
import 'package:haraj/utils/api_controller/ads_api/ads_api_controller.dart';
import 'package:haraj/utils/api_controller/auth_api_controller.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:haraj/utils/repository/auth_repo.dart';
import 'package:haraj/utils/repository/complete_user_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../feature/app/auth/otp/controller/otp_controller.dart';
import 'api/network_info.dart';
import 'api_controller/complete_user_profile_controller.dart';

class MainInjection implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl networkInfoImpl =
        NetworkInfoImpl(InternetConnectionChecker());
    //AuthRepository(networkInfo: NetworkInfoImpl(InternetConnectionChecker()),remoteDataSource: AuthController());

    Get.put(AuthRepository(
        remoteDataSource: AuthController(), networkInfo: networkInfoImpl));

    Get.put(CompletePersonalInfoRepo(
        remoteDataSource: CompleteUserProfileController(),
        networkInfo: networkInfoImpl));

    Get.put(OTPGetxController());

    Get.put(AdsRepository(
        networkInfo: networkInfoImpl, remoteDataSource: AdsApiController()));
  }
}
