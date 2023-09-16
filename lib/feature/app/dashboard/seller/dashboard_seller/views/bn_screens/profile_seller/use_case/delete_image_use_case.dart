import 'package:dartz/dartz.dart';
import 'package:haraj/utils/repository/profile_repo.dart';

import '../../../../../../../../../utils/api/api_response.dart';
import '../../../../../../../../../utils/errors/failures.dart';
class DeleteImageStoreUseCase {
  ProfileRepo repository;

  DeleteImageStoreUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call(int imageId) async {
    return await repository.deleteImage(id: imageId);
  }
}