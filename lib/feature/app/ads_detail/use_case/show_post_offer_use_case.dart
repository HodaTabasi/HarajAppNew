import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/main_offer_model.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class ShowPostOfferUseCase {
  OfferRepository repository;

  ShowPostOfferUseCase({required this.repository});

  Future<Either<Failure, MainOfferModel>> call(
      String postId, int pageNumber) async {
    return await repository.showPostOffers(postId: postId, page: pageNumber);
  }
}
