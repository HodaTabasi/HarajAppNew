import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/chat/controller/chat_controller.dart';
import 'package:haraj/feature/app/chat/use_case/chat_details_use_case.dart';
import 'package:haraj/feature/app/chat/use_case/send_message_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/chat/Message.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/client_model.dart';
import '../../../../utils/repository/chat_repo/chat_repo.dart';


class ChatDetailsController extends GetxController {
  final num chatId; // Add this line to store the chatId

  ChatDetailsController({required this.chatId}); // Add this constructor

  static ChatDetailsController get to => Get.find<ChatDetailsController>();

  RxBool loading = false.obs;
  RxBool isFavoriteLoading = false.obs;
  var responseMessage = "";
  Rx<Data> adsDetail = Data().obs;
  RxList<Message> chatMessages = <Message>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;
  late TextEditingController chatFieldController;


  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    chatFieldController = TextEditingController();
    getChatDetails();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getChatDetails(pageNumber: (meta.currentPage ?? 0) + 1);
      }
    }
  }

  bool checkData() {
    if (chatFieldController.text.trim().isNotEmpty) {
      return true;
    }
    return false;
  }
  Future<void> getChatDetails({pageNumber = 1}) async {
    loading.value = true;
    return ChatDetailsUseCase(repository: Get.find<ChatsRepository>())
        .call(pageNumber, chatId)
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
      chatMessages.addAll(response.data ?? []);
      meta = response.meta!;
      loading.value = false;
    }));
  }

  Future<void> sendMessage() async {
    if(!checkData()) return;
    final content = chatFieldController.text;
    chatFieldController.clear();
    final tempId = DateTime.now().millisecondsSinceEpoch;
    appendMessage(
        chatId,
        Message(
          id: tempId,
          content: content,
          isMine: true,
          client: ClientModel(),
          sending: true,
          createdAt: 'منذ ثانية',
        ));
      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut);
    SendMessageUseCase(repository: Get.find<ChatsRepository>())
        .call(id:chatId, content:content)
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
      setMessageAsSent(tempId);
          final idx = chatMessages.indexWhere((element) => element.id == tempId);
          if(idx != -1) {
            chatMessages[idx] = response;
          }
      HomeChatController.to.updateLastMessage(chatId, response);
    }));
  }

  void appendMessage(num chatId, Message msg) {
    if(chatId == this.chatId) {
      chatMessages.insert(0, msg);
    }
  }

  void setMessageAsSent(num messageId) {
    chatMessages
        .firstWhere((element) => element.id == messageId)
        .sending = false;
  }

}
