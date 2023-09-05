import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/ads_api/ads_api_controller.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';

import '../../errors/exceptions.dart';
import '../../errors/failures.dart';

class AdsRepository {
  final AdsApiController remoteDataSource;
  final NetworkInfo networkInfo;

  AdsRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, AdsModel>> getIndex() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.index();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, AdsModel>> getShow(id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.show(id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, AdsModel>> store({
    price,
    carId,
    brandId,
    bodyId,
    mechanicalStatusId,
    standardId,
    generalStatusId,
    fuelId,
    gearId,
    drivingSideId,
    sellerTypeId,
    technicalAdvantageId,
    seatId,
    cylinderId,
    doorId,
    year,
    engineId,
    distance,
    outColor,
    inColor,
    details,
    guarantee,
    finance,
    exportable,
    whatsapp,
    facebook,
    whatsappConnection,
    facebookConnection,
    call,
    chat,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.store(
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

        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
