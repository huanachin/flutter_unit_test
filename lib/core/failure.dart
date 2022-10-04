abstract class Failure {
  String? message;

  Failure(this.message);
}

class SocketTimeOutFailure extends Failure {
  SocketTimeOutFailure(String message) : super(message);
}

class HttpFailure extends Failure {
  final int code;

  HttpFailure(String name, this.code) : super(name);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure([String? message]) : super(message);
}
