import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class RejectOfferUseCase {
  OfferRepository repository;

  RejectOfferUseCase({required this.repository});

  Future<Either<Failure, OfferModel>> call(String postId) async {
    return await repository.rejectOffers(postId: postId);
  }
}
