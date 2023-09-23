import 'package:dartz/dartz.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

import '../../../../../../../../../utils/errors/failures.dart';
import '../../../../../../../../../utils/models/general/general_model.dart';
import '../../../../../../../../../utils/models/seller_info/image.dart';

class AddAdsSocialContactUseCase {
  AdsRepository repository;

  AddAdsSocialContactUseCase({required this.repository});

  Future<Either<Failure, dynamic>> call( whatsapp, facebook,
      whatsappConnection,
      facebookConnection,
      call,
      chat) async {
    return await repository.addSocialContactAds(whatsapp:whatsapp, facebook:facebook,
        whatsappConnection:whatsappConnection,
        facebookConnection:facebookConnection,
        call:call,
        chat:chat);
  }
}
