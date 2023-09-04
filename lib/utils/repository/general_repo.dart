import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api_controller/general_api_controller.dart';
import 'package:haraj/utils/models/governorates_model/governorates_response.dart';

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
}
