
import 'package:dartz/dartz.dart';
import 'package:haraj/utils/models/seller_info/address_model.dart';

import '../../../../../../utils/errors/failures.dart';
import '../../../../../../utils/models/seller_info/seller_user_model.dart';
import '../../../../../../utils/models/seller_info/store_model.dart';
import '../../../../../../utils/models/user/user_model.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';

class CompleteAddressUseCase {
  CompletePersonalInfoRepo repository;

  CompleteAddressUseCase({required this.repository});

  Future<Either<Failure, UserModel>> call(Address address) async {
    return await repository.completeAddressData(addressData: address);
  }
}