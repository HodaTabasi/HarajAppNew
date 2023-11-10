import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/chat/chats_model.dart';
import 'package:haraj/utils/repository/chat_repo/chat_repo.dart';

class HomeChatUseCase {
  ChatsRepository repository;

  HomeChatUseCase({required this.repository});

  Future<Either<Failure, ChatsModel>> call(int pageNumber) async {
    return await repository.getIndex(page: pageNumber);
  }
}
