import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/repository/store_repo/store_repo.dart';

class DestroyPostShowUseCase {
  StoreRepository repository;

  DestroyPostShowUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call(int adsId) async {
    return await repository.destroyPost(id: adsId);
  }
}
