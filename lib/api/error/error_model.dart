import 'package:task/api/error/error_type.dart';

import 'response_status.dart';

class ErrorModel{

 late String _message;
 late ErrorType _type;
  late ResponseStatus _status;

  ErrorModel(String message, ErrorType type,{ResponseStatus status=ResponseStatus.None})
  {
    this._message=message;
    this._type=type;
    this._status=status;
  }

  get message => _message;
  get type => _type;
  get status => _status;




}