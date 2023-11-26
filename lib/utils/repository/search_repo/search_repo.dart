import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';

import '../../api_controller/search_api/search_api_controller.dart';
import '../../errors/exceptions.dart';
import '../../errors/failures.dart';
import '../../models/car_properties/car_properties.dart';

class SearchRepository {
  final SearchApiController remoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, AdsModel>> getIndex({fuelId,cityId,governorateId,brandId,keyword, page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.index(fuelId: fuelId, cityId : cityId, governorateId: governorateId,
            brandId: brandId, keyword: keyword, page: page);
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
