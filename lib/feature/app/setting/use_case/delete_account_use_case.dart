import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/api_response.dart';
import 'package:haraj/utils/repository/setting_repo.dart';

import '../../../../utils/errors/failures.dart';

class DeleteAccountUseCase {
  SettingRepo repository;

  DeleteAccountUseCase({required this.repository});

  Future<Either<Failure, ApiResponse>> call() async {
    return await repository.deleteAccount();
  }
}