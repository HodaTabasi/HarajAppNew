import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/car_properties/car_properties.dart';

import '../../../../../../../../../utils/errors/failures.dart';
import '../../../../../../../../../utils/repository/ads_repo/ads_repo.dart';

class GetPropertiesUseCase {
  AdsRepository repository;

  GetPropertiesUseCase({required this.repository});

  Future<Either<Failure, CarProperties>> call(){
    return repository.getCarProperties();
  }
}