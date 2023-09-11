
import 'package:dartz/dartz.dart';

import '../../../../../../utils/errors/failures.dart';
import '../../../../../../utils/models/seller_info/seller_user_model.dart';
import '../../../../../../utils/models/user/user_model.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';

class CompleteProfileUseCase {
  CompletePersonalInfoRepo repository;

  CompleteProfileUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(SellerUserModel userModel,String? imagePath) async {
    return await repository.completePersonalProfile(user: userModel,imageFile: imagePath);
  }
}