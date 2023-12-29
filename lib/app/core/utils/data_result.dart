import 'result.dart';

class DataResult<T> extends Result {
  T? data;

  DataResult(bool success, String message, {required this.data}) : super(message, success);

  DataResult.success(String message, {required this.data}) : super(message, true);

  DataResult.fail(String message) : super(message, false);
}
