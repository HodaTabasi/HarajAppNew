import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class AcceptOfferUseCase {
  OfferRepository repository;

  AcceptOfferUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call(String postId) async {
    return await repository.acceptOffers(postId: postId);
  }
}
