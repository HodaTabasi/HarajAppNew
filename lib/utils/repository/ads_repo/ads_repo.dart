import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/ads_api/ads_api_controller.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';

import '../../errors/exceptions.dart';
import '../../errors/failures.dart';

class AdsRepository {
  final AdsApiController remoteDataSource;
  final NetworkInfo networkInfo;

  AdsRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, AdsModel>> getIndex() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.index();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
