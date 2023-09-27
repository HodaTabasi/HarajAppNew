import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/favorite_api/favorite_api_controller.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';

import '../../errors/exceptions.dart';
import '../../errors/failures.dart';

class FavoriteRepository {
  final FavoriteApiController remoteDataSource;
  final NetworkInfo networkInfo;

  FavoriteRepository(
      {required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, StorePostModel>> getFavoriteAds({page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getFavoriteAds(page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, PostModel>> postFavoriteAds({id}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.postFavoriteAds(id: id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
