import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class AdsShowUseCase {
  AdsRepository repository;

  AdsShowUseCase({required this.repository});

  Future<Either<Failure, AdsModel>> call(int id) async {
    return await repository.getShow(id);
  }
}
