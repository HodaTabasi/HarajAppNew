import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/repository/setting_repo.dart';

import '../../../../utils/errors/failures.dart';

class UpdateEmailUseCase {
  SettingRepo repository;

  UpdateEmailUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(String email) async {
    return await repository.updateEmail(email);
  }
}