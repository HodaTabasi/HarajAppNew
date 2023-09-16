import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/store_api/store_api_controller.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';

import '../../errors/exceptions.dart';
import '../../errors/failures.dart';

class StoreRepository {
  final StoreApiController remoteDataSource;
  final NetworkInfo networkInfo;

  StoreRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, StorePostModel>> getStorePost({id, page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.storePost(id: id, page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
