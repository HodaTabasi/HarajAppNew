import 'package:json_annotation/json_annotation.dart';
part 'process_response.g.dart';

@JsonSerializable()
class ProcessResponse {
  @JsonKey(name:"status")
   bool? status;
  @JsonKey(name:"message")
   String? message;

  // ProcessResponse({
  //   required this.message,
  //   this.status = false,
  // });
}