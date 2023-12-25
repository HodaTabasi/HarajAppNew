import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/user/user_model.dart';

import '../../../../../utils/errors/failures.dart';
import '../../../../../utils/repository/auth_repo.dart';

class VerifyUseCase {
  AuthRepository repository;

  VerifyUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(String code) async {
    return await repository.verify(code:code);
  }
}