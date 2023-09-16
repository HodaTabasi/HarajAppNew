import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';
import 'package:haraj/utils/repository/store_repo/store_repo.dart';

class StorePostShowUseCase {
  StoreRepository repository;

  StorePostShowUseCase({required this.repository});

  Future<Either<Failure, StorePostModel>> call(int id, int pageNumber) async {
    return await repository.getStorePost(id: id, page: pageNumber);
  }
}
