
import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/governorates_model/governorates_response.dart';
import 'package:haraj/utils/repository/general_repo.dart';

import '../../../../../../utils/errors/failures.dart';
import '../../../../../../utils/models/seller_info/seller_user_model.dart';
import '../../../../../../utils/models/seller_info/store_model.dart';
import '../../../../../../utils/models/user/user_model.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';

class GetGovernorateUseCase {
  GeneralRepository repository;

  GetGovernorateUseCase({required this.repository});

  Future<Either<Failure, GovernoratesResponse>> call() async {
    return await repository.getGovernorate();
  }
}