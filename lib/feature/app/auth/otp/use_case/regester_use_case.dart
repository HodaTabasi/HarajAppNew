import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/verify_response.dart';
import 'package:haraj/utils/models/user/user_model.dart';

import '../../../../../utils/errors/failures.dart';
import '../../../../../utils/repository/auth_repo.dart';

class RegisterUseCase {
  AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(String code) async {
    return await repository.verifyAndRegister(code:code);
  }
}