class ApiResponse<T> {
  final String message;
  final bool success;
  T? object;

  ApiResponse(this.message, this.success, [this.object]);
}