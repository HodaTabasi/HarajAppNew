import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';

import '../api/network_info.dart';
import '../api_controller/setting_api_controller.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../models/user/user_model.dart';

class SettingRepo {
  final SettingApiController remoteDataSource;
  final NetworkInfo networkInfo;

  SettingRepo({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, UserModel>> updateEmail(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updateEmail(email:email );
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

  }

  Future<Either<Failure, UserModel>> updatePassword(String password,String confirmPassword,currentPassword) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.updatePassword(password: password,confirmPassword: confirmPassword,currentPassword: currentPassword);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

  }

  Future<Either<Failure, ApiResponse>> deleteAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.deleteAccount();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ApiResponse>> logoutAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.logoutAccount();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

  }
}