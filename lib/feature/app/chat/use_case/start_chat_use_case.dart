import 'package:dartz/dartz.dart';
import 'package:haraj/utils/errors/failures.dart';
import 'package:haraj/utils/models/chat/chat_conversation.dart';
import 'package:haraj/utils/repository/chat_repo/chat_repo.dart';

class StartChatUseCase {
  ChatsRepository repository;

  StartChatUseCase({required this.repository});

  Future<Either<Failure, ChatConversation>> call({required postId,required chatTo, required String content}) async {
    return await repository.startChat(postId: postId,chatTo: chatTo, content: content);
  }
}
