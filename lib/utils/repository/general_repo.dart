import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';
import 'package:haraj/utils/api_controller/general_api_controller.dart';
import 'package:haraj/utils/models/governorates_model/governorates_response.dart';
import 'package:haraj/utils/models/setting/setting.dart';

import '../api/network_info.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class GeneralRepository {
  final GeneralApiController remoteDataSource;
  final NetworkInfo networkInfo;

  GeneralRepository(
      {required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, GovernoratesResponse>> getGovernorate() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getGovernorates();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ApiResponse>> sendFcmToken({token}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.sendFCMToken(token: token);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, SettingModel>> getSetting() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getSettings();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

}
