import 'package:get/get.dart';
import 'package:haraj/utils/api_controller/ads_api/ads_api_controller.dart';
import 'package:haraj/utils/api_controller/auth_api_controller.dart';
import 'package:haraj/utils/api_controller/chat_api/chats_api_controller.dart';
import 'package:haraj/utils/api_controller/favorite_api/favorite_api_controller.dart';
import 'package:haraj/utils/api_controller/offer_api_controller/offer_api_controller.dart';
import 'package:haraj/utils/api_controller/profile_api_controller.dart';
import 'package:haraj/utils/api_controller/search_api/search_api_controller.dart';
import 'package:haraj/utils/api_controller/store_api/store_api_controller.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:haraj/utils/repository/auth_repo.dart';
import 'package:haraj/utils/repository/chat_repo/chat_repo.dart';
import 'package:haraj/utils/repository/complete_user_repo.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';
import 'package:haraj/utils/repository/general_repo.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';
import 'package:haraj/utils/repository/profile_repo.dart';
import 'package:haraj/utils/repository/search_repo/search_repo.dart';
import 'package:haraj/utils/repository/setting_repo.dart';
import 'package:haraj/utils/repository/store_repo/store_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../feature/app/auth/otp/controller/otp_controller.dart';
import '../feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/add_contact_information_seller/controllers/add_contact_information_seller_controller.dart';
import '../feature/app/profile/complete_profile/controller/complete_profile_buyer_controller.dart';
import '../feature/app/profile/complete_profile/controller/complete_profile_seller_controller.dart';
import '../feature/app/profile/seller/add_address_seller/controller/add_address_seller_controller.dart';
import '../feature/app/profile/seller/complete_store_seller/controller/complete_store_seller_controller.dart';
import '../feature/app/setting/controller/setting_getx_controller.dart';
import 'api/network_info.dart';
import 'api_controller/complete_user_profile_controller.dart';
import 'api_controller/general_api_controller.dart';
import 'api_controller/setting_api_controller.dart';

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
    Get.put(ProfileRepo(
        networkInfo: networkInfoImpl,
        remoteDataSource: ProfileApiController()));
    Get.put(GeneralRepository(
        remoteDataSource: GeneralApiController(),
        networkInfo: networkInfoImpl));

    Get.put(OTPGetxController());

    Get.put(SettingGetXController());

    Get.put(AddContactInformationSellerController());
    //Get.put(ProfileSellerController());
    Get.put(CompleteProfileSellerController());

    Get.put(AddAddressSellerController());

    Get.put(SettingGetXController());

    Get.put(CompleteStoreSellerController());

    Get.put(AdsRepository(
        networkInfo: networkInfoImpl, remoteDataSource: AdsApiController()));

    Get.put(SearchRepository(
        networkInfo: networkInfoImpl, remoteDataSource: SearchApiController()));

    Get.put(ChatsRepository(
        networkInfo: networkInfoImpl, remoteDataSource: ChatsApiController()));

    Get.put(StoreRepository(
        networkInfo: networkInfoImpl, remoteDataSource: StoreApiController()));

    Get.put(CompleteProfileBuyerController());

    Get.put(OfferRepository(
        networkInfo: networkInfoImpl, remoteDataSource: OfferApiController()));

    Get.put(FavoriteRepository(
        networkInfo: networkInfoImpl,
        remoteDataSource: FavoriteApiController()));

    Get.put(SettingRepo(
        networkInfo: networkInfoImpl,
        remoteDataSource: SettingApiController()));
  }
}
