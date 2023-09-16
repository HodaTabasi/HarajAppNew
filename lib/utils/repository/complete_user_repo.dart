import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/store_model.dart';
import 'package:haraj/utils/models/user/user_model.dart';

import '../api/network_info.dart';
import '../api_controller/complete_user_profile_controller.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../models/seller_info/seller_user_model.dart';

class CompletePersonalInfoRepo {
  final CompleteUserProfileController remoteDataSource;
  final NetworkInfo networkInfo;

  CompletePersonalInfoRepo({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, UserModel>> completePersonalProfile({user,imageFile}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updatePersonalInfo(userModel: user,path:imageFile);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, UserModel>> completeStoreData({storeData,imageFile}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateStoreInfo(store: storeData,path:imageFile);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, UserModel>> updateStoreImage({storeImages}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateStoreImage(images: storeImages);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, UserModel>> completeAddressData({addressData}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateAddressInfo(address: addressData);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
