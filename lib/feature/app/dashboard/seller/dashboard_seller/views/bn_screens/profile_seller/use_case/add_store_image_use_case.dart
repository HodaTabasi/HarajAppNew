import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/image.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/repository/profile_repo.dart';

import '../../../../../../../../../utils/api/api_response.dart';
import '../../../../../../../../../utils/errors/failures.dart';
import '../../../../../../../../../utils/repository/complete_user_repo.dart';
class AddImageStoreUseCase {
  CompletePersonalInfoRepo repository;

  AddImageStoreUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(List<MyImage> images) async {
    return await repository.updateStoreImage(storeImages: images);
  }
}