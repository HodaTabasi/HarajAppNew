import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class AdsUseCase {
  AdsRepository repository;

  AdsUseCase({required this.repository});

  Future<Either<Failure, AdsModel>> call(int pageNumber) async {
    return await repository.getIndex(page: pageNumber);
  }
}
