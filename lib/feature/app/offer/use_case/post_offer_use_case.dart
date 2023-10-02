import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class PostOfferUseCase {
  OfferRepository repository;

  PostOfferUseCase({required this.repository});

  Future<Either<Failure, OfferModel>> call(String postId, String amount) async {
    return await repository.postOffers(postId: postId, amount: amount);
  }
}
