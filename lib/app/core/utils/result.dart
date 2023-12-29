class Result {
  String? message;
  bool success;
  Result(
    this.message,
    this.success,
  );

  Result.success([this.message = ""]) : success = true;
  Result.fail(this.message) : success = false;
}