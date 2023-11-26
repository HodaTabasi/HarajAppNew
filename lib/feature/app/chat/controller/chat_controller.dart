import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/chat/use_case/home_chat_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/chat/message.dart';
import 'package:haraj/utils/models/chat/chat_conversation.dart';
import 'package:haraj/utils/repository/chat_repo/chat_repo.dart';

import '../../../../utils/models/meta/meta_model.dart';

class HomeChatController extends GetxController {
  static HomeChatController get to => Get.find<HomeChatController>();
  RxBool loading = false.obs;
  var responseMessage = "";
  RxList<ChatConversation> chatConversations = <ChatConversation>[].obs;
  Meta meta = Meta();

  late ScrollController scrollController;
  late TextEditingController searchController;
  late TextEditingController messageController;

  @override
  void onInit() {
    searchController = TextEditingController();
    messageController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    getIndexChats();
    super.onInit();
  }


  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent - 100) {
      if (meta.currentPage! < meta.lastPage!) {
        getIndexChats(pageNumber: meta.currentPage);
      }
    }
  }


  @override
  void dispose() {
    searchController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getIndexChats({pageNumber = 1}) async {
    loading.value = true;
    return HomeChatUseCase(repository: Get.find<ChatsRepository>())
        .call(pageNumber)
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      loading.value = false;
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (response) async {
      chatConversations.addAll(response.data ?? []);
      meta = response.meta!;
      loading.value = false;
    }));
  }
  void updateLastMessage(num chatId , Message msg) {
    if (chatConversations.isNotEmpty) {
      final idx = chatConversations
          .indexWhere((element) => element.id == chatId);
      if (idx != -1) {
        chatConversations[idx].lastMessageContent = msg.content;
        chatConversations[idx].lastMessageCreatedAt = msg.createdAt;
        // ++chatConversations[idx].unreadMessagesCount;
        if(idx != 0) { //move the conversation to the top of the list if not
          final temp = chatConversations[idx];
          chatConversations.removeAt(idx);
          chatConversations.insert(0, temp);
        }
        }
      chatConversations.refresh();
    }
  }

}
