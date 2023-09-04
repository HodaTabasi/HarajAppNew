import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/repository/auth_repo.dart';

import '../../../../../utils/errors/failures.dart';

class LoginUseCase {
  AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(String email,String password) async {
    return await repository.login(email: email,password: password);
  }
}