import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/repository/store_repo/store_repo.dart';

class SoldPostShowUseCase {
  StoreRepository repository;

  SoldPostShowUseCase({required this.repository});

  Future<Either<Failure, PostModel>> call(int postId) async {
    return await repository.soldPost(id: postId);
  }
}
