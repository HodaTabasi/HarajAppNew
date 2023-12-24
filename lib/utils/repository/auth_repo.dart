import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api_controller/auth_api_controller.dart';
import 'package:haraj/utils/models/seller_info/verify_response.dart';
import 'package:haraj/utils/models/user/user_model.dart';

import '../api/network_info.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../models/user/forget_password_resp.dart';
import '../prefs/shared_pref_controller.dart';

class AuthRepository {
  final AuthController remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, UserModel>> login({email, password}) async {
    return _getMessage(
        () => remoteDataSource.login(email: email, password: password));
  }

  Future<Either<Failure, verifiyResponse>> register(
      {email, password, type}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.registration(
            email: email, password: password, type: type);

        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, UserModel>> verifyAndRegister({code}) async {
    return _getMessage(() => remoteDataSource.verify(
        code: code, hashKey: SharedPrefController().vierifyCode));
  }

  Future<Either<Failure, verifiyResponse>> resendCode({email}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.reSendVerify(email: email);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ForgetPasswordResp>> forgetPassword({password, password_confirmation}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.forgetPassword(password: password, password_confirmation: password_confirmation);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
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
