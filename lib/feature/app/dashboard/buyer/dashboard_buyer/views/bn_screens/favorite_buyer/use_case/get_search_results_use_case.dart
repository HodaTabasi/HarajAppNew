import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/search_results/search_results_model.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';

class GetSearchResultsShowUseCase {
  FavoriteRepository repository;

  GetSearchResultsShowUseCase({required this.repository});

  Future<Either<Failure, SearchResultsModel>> call(int pageNumber) async {
    return await repository.getSearchResults(page: pageNumber);
  }
}
