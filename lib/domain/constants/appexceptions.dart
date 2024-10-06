class AppExceptions implements Exception {
  final String errormsg;
  AppExceptions({required this.errormsg});

  @override
  String toString() {
    return errormsg;
  }

  String toErrormsg() {
    return toString();
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException({required String errormsg})
      : super( errormsg: errormsg);
}

class BadRequestException extends AppExceptions {
  BadRequestException({required String errormsg})
      : super( errormsg: errormsg);
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException({required String errormsg})
      : super(errormsg: errormsg);
}

class InvalidInputException extends AppExceptions {
  InvalidInputException({required String errormsg})
      : super(errormsg: errormsg);
}
