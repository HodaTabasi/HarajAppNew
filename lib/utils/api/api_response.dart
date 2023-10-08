class ApiResponse<T> {
   late String message;
   late bool success;
   String? reason;
  T? object;

  ApiResponse(this.message, this.success, [this.object]);

   ApiResponse.fromJson(Map<String,dynamic> json){
    this.success = json['status'];
    this.message = json['message'];
    if(json['reason'] != null){
      this.reason = json['reason'];
    }
  }
}