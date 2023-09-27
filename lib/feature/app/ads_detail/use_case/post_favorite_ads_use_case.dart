import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';

class PostFavoriteAdsShowUseCase {
  FavoriteRepository repository;

  PostFavoriteAdsShowUseCase({required this.repository});

  Future<Either<Failure, PostModel>> call(int adsId) async {
    return await repository.postFavoriteAds(id: adsId);
  }
}
