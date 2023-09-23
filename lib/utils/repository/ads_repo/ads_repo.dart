import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/ads_api/ads_api_controller.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/instruction/instruction_model.dart';

import '../../errors/exceptions.dart';
import '../../errors/failures.dart';
import '../../models/car_properties/car_properties.dart';

class AdsRepository {
  final AdsApiController remoteDataSource;
  final NetworkInfo networkInfo;

  AdsRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, AdsModel>> getIndex({page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.index(page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, Data>> getShow(id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.show(id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, InstructionModel>> getInstruction() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.instruction();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, CarProperties>> getCarProperties() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.carProperties();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
