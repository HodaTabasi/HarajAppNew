
import 'package:dartz/dartz.dart';

import '../../../../../../utils/errors/failures.dart';
import '../../../../../../utils/models/seller_info/seller_user_model.dart';
import '../../../../../../utils/models/seller_info/store_model.dart';
import '../../../../../../utils/models/user/user_model.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';

class CompleteStoreUseCase {
  CompletePersonalInfoRepo repository;

  CompleteStoreUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(Store store,String? imagePath,String? imagePath1) async {
    return await repository.completeStoreData(storeData: store,imageFile: imagePath,imageFileComm: imagePath1);
  }
}