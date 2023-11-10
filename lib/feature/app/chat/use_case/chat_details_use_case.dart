import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/chat/messages_model.dart';
import 'package:haraj/utils/repository/chat_repo/chat_repo.dart';

class ChatDetailsUseCase {
  ChatsRepository repository;

  ChatDetailsUseCase({required this.repository});

  Future<Either<Failure, MessagesModel>> call(int pageNumber, id) async {
    return await repository.getChatDetails(page: pageNumber, id: id);
  }
}
