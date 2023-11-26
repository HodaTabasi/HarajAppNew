import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

import '../../../../../../../../../utils/repository/search_repo/search_repo.dart';

class SearchUseCase {
  SearchRepository repository;

  SearchUseCase({required this.repository});

  Future<Either<Failure, AdsModel>> call(int fuelId, int cityId, int governorateId, int brandId, String keyword,int pageNumber) async {
    return await repository.getIndex(fuelId: fuelId, cityId : cityId, governorateId : governorateId, brandId: brandId, keyword :keyword ,page: pageNumber);
  }
}
