import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/verify_response.dart';

import '../../../../../utils/errors/failures.dart';
import '../../../../../utils/models/user/forget_password_resp.dart';
import '../../../../../utils/repository/auth_repo.dart';

class ForgetPasswordUseCase {
  AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Either<Failure, ForgetPasswordResp>> call(String password, String passwordConfirmation) async {
    return await repository.forgetPassword(password: password, password_confirmation: passwordConfirmation);
  }
}