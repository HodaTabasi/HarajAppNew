import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/repository/setting_repo.dart';

import '../../../../utils/errors/failures.dart';

class UpdatePasswordUseCase {
  SettingRepo repository;

  UpdatePasswordUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(String password,String currentPassword,String confirmPassword) async {
    return await repository.updatePassword(password,confirmPassword,currentPassword);
  }
}