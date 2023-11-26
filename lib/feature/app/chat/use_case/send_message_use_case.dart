import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/chat/message.dart';
import 'package:haraj/utils/repository/chat_repo/chat_repo.dart';

class SendMessageUseCase {
  ChatsRepository repository;

  SendMessageUseCase({required this.repository});

  Future<Either<Failure, Message>> call({required id, required String content}) async {
    return await repository.sendMessage(id: id, content: content);
  }
}
