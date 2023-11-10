import 'package:dartz/dartz.dart';
import 'package:haraj/utils/api/network_info.dart';
import 'package:haraj/utils/api_controller/chat_api/chats_api_controller.dart';
import 'package:haraj/utils/models/chat/Message.dart';
import 'package:haraj/utils/models/chat/chats_model.dart';

import '../../errors/exceptions.dart';
import '../../errors/failures.dart';
import '../../models/chat/messages_model.dart';

class ChatsRepository {
  final ChatsApiController remoteDataSource;
  final NetworkInfo networkInfo;

  ChatsRepository({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, ChatsModel>> getIndex({page}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.index(page: page);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  Future<Either<Failure, MessagesModel>> getChatDetails({page, required id}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.chatDetails(page: page, id: id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  Future<Either<Failure, Message>> sendMessage({required String content, required id}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.sendMessage(id : id, content: content);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }



  // Future<Either<Failure, Data>> getShow(id) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final response = await remoteDataSource.show(id);
  //       return Right(response);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(OfflineFailure());
  //   }
  // }
  //
  // Future<Either<Failure, ApiResponse>> toggleFavorite({postId}) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final response = await remoteDataSource.toggleFavorite(postId: postId);
  //       return Right(response);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     return Left(OfflineFailure());
  //   }
  // }
}
