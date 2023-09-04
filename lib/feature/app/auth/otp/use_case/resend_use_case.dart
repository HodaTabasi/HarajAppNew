import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/verify_response.dart';

import '../../../../../utils/errors/failures.dart';
import '../../../../../utils/repository/auth_repo.dart';

class ResendVerifyUseCase {
  AuthRepository repository;

  ResendVerifyUseCase({required this.repository});

  Future<Either<Failure, verifiyResponse>> call(String email) async {
    return await repository.resendCode(email: email);
  }
}