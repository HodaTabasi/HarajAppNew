import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class AddAdsSellerUseCase {
  AdsRepository repository;

  AddAdsSellerUseCase({required this.repository});

  Future<Either<Failure, AdsModel>> call(
    String price,
    String carId,
    String brandId,
    String bodyId,
    String mechanicalStatusId,
    String standardId,
    String generalStatusId,
    String fuelId,
    String gearId,
    String drivingSideId,
    String sellerTypeId,
    String technicalAdvantageId,
    String seatId,
    String cylinderId,
    String doorId,
    String year,
    String engineId,
    String distance,
    String outColor,
    String inColor,
    String details,
    String guarantee,
    String finance,
    String exportable,
    String whatsapp,
    String facebook,
    String whatsappConnection,
    String facebookConnection,
    String call,
    String chat,
  ) async {
    return await repository.store(
        price: price,
        carId: carId,
        brandId: brandId,
        bodyId: bodyId,
        mechanicalStatusId: mechanicalStatusId,
        standardId: standardId,
        generalStatusId: generalStatusId,
        fuelId: fuelId,
        gearId: gearId,
        drivingSideId: drivingSideId,
        sellerTypeId: sellerTypeId,
        technicalAdvantageId: technicalAdvantageId,
        seatId: seatId,
        cylinderId: cylinderId,
        doorId: doorId,
        year: year,
        engineId: engineId,
        distance: distance,
        outColor: outColor,
        inColor: inColor,
        details: details,
        guarantee: guarantee,
        finance: finance,
        exportable: exportable,
        whatsapp: whatsapp,
        facebook: facebook,
        whatsappConnection: whatsappConnection,
        facebookConnection: facebookConnection,
        call: call,
        chat: chat);
  }
}
