import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/offer_api_controller/offer_api_controller.dart';
import 'package:haraj/utils/errors/exceptions.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/main_offer_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';

class OfferRepository {
  final OfferApiController remoteDataSource;
  final NetworkInfo networkInfo;

  OfferRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, OfferModel>> postOffers({postId, amount}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.offers(postId: postId, amount: amount);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, MainOfferModel>> showPostOffers({postId, page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.showPostOffers(postId: postId, page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, MainOfferModel>> showPostNewOffers({page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.showPostNewOffers(page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, MainOfferModel>> showPostRejectedOffers({page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.showPostRejectedOffers(page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, MainOfferModel>> showPostAcceptedOffers({page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.showPostAcceptedOffers(page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ApiResponse>> acceptOffers({postId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.acceptOffers(postId: postId);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ApiResponse>> rejectOffers({postId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.rejectOffers(postId: postId);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ApiResponse>> destroyOffers({postId}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.destroyOffers(postId: postId);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
