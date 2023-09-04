//FAILURE
import 'failures.dart';

String SERVER_FAILURE_MESSAGE = 'Please try again later .';
String CHECK_MESSAGE = 'التاكد من الضغط على الموافقة على الشروط';
const String EMPTY_CACHE_FAILURE_MESSAGE = 'No Data';
const String OFFLINE_FAILURE_MESSAGE = 'Please Check your Internet Connection';

//MESSAGE
const ADD_SUCCESS_MESSAGE = "Post Added Successfully";
const DELETE_SUCCESS_MESSAGE = "Post Deleted Successfully";
const UPDATE_SUCCESS_MESSAGE = "تم التعديل بنجاح";

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
