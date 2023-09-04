import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/verify_response.dart';

import '../../../../../utils/errors/failures.dart';
import '../../../../../utils/repository/auth_repo.dart';

class VerifyUseCase {
  AuthRepository repository;

  VerifyUseCase({required this.repository});

  Future<Either<Failure, verifiyResponse>> call(String email,String password,String type) async {
    return await repository.register(email: email,password: password,type:type);
  }
}