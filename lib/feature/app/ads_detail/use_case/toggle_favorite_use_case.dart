import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';

import '../../../../utils/errors/failures.dart';
import '../../../../utils/repository/ads_repo/ads_repo.dart';

class ToggleFavoriteUseCase {
  AdsRepository repository;

  ToggleFavoriteUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call(
      String postId) async {
    return await repository.toggleFavorite(postId: postId);
  }
}