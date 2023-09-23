import 'package:dartz/dartz.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

import '../../../../../../../../../utils/errors/failures.dart';
import '../../../../../../../../../utils/models/general/general_model.dart';
import '../../../../../../../../../utils/models/seller_info/image.dart';

class AddAdsSellerUseCase {
  AdsRepository repository;

  AddAdsSellerUseCase({required this.repository});

  Future<Either<Failure, dynamic>> call( List<MyImage> images,
       Map<String, GeneralModel> selectedData,
       price,
       year,
       kelometer,
       details) async {
    return await repository.addAds(images: images,selectedData: selectedData,price: price,details: details,kelometer: kelometer,year: year);
  }
}
