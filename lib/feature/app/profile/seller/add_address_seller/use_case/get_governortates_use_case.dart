import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/governorates_model/governorates_response.dart';
import 'package:haraj/utils/repository/general_repo.dart';

import '../../../../../../utils/errors/failures.dart';

class GetGovernorateUseCase {
  GeneralRepository repository;

  GetGovernorateUseCase({required this.repository});

  Future<Either<Failure, GovernoratesResponse>> call() async {
    return await repository.getGovernorate();
  }
}
