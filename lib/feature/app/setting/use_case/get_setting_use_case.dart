import 'package:dartz/dartz.dart';
import 'package:haraj/utils/repository/general_repo.dart';

import '../../../../utils/errors/failures.dart';
import '../../../../utils/models/setting/setting.dart';

class GetSettingUseCase {
  GeneralRepository repository;

  GetSettingUseCase({required this.repository});

  Future<Either<Failure, SettingModel>> call() async {
    return await repository.getSetting();
  }
}