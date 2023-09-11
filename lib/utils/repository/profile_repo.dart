import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api_controller/profile_api_controller.dart';

import '../api/network_info.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../models/user/user_model.dart';

class ProfileRepo {
  final ProfileApiController remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepo({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, UserModel>> getProfile(){
   return _getMessage(
              () => remoteDataSource.getProfile());

  }
  Future<Either<Failure, UserModel>> _getMessage(Function loginOrCreate) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginOrCreate();
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}