import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';

class FavoritePostShowUseCase {
  FavoriteRepository repository;

  FavoritePostShowUseCase({required this.repository});

  Future<Either<Failure, StorePostModel>> call(int pageNumber) async {
    return await repository.getFavoriteAds(page: pageNumber);
  }
}
