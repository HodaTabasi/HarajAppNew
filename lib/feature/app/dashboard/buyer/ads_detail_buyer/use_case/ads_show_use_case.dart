import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/instruction/instruction_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class AdsShowUseCase {
  AdsRepository repository;

  AdsShowUseCase({required this.repository});

  Future<Either<Failure, Data>> call(int id) async {
    return await repository.getShow(id);
  }

  Future<Either<Failure, OfferModel>> postOffer(
      String postId, String amount) async {
    return await repository.postOffers(postId: postId, amount: amount);
  }

  Future<Either<Failure, InstructionModel>> callInstruction() async {
    return await repository.getInstruction();
  }
}
