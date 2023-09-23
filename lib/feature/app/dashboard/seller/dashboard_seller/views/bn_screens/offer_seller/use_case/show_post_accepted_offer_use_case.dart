import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/main_offer_model.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class ShowPostAcceptedOfferUseCase {
  OfferRepository repository;

  ShowPostAcceptedOfferUseCase({required this.repository});

  Future<Either<Failure, MainOfferModel>> call(int pageNumber) async {
    return await repository.showPostAcceptedOffers(page: pageNumber);
  }
}
