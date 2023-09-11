import 'package:dartz/dartz.dart';

import '../../../../../../../../../utils/errors/failures.dart';
import '../../../../../../../../../utils/models/user/user_model.dart';
import '../../../../../../../../../utils/repository/profile_repo.dart';

class GetProfileUseCase {
  ProfileRepo repository;

  GetProfileUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call() async {
    return await repository.getProfile();
  }
}