import 'package:rxdart/rxdart.dart';

class ValidatePasswordBloc {
  factory ValidatePasswordBloc() => _singleton;

  ValidatePasswordBloc._() {
    _isObscureTextController.value = true;
  }

  static final ValidatePasswordBloc _singleton = ValidatePasswordBloc._();

  final _isObscureTextController = BehaviorSubject<bool>();

  ValueStream<bool> get isObscureTextStream => _isObscureTextController.stream;

  void setIsObscure(bool value) {
    if (_isObscureTextController.value == true) {
      _isObscureTextController.value = false;
    } else {
      _isObscureTextController.value = true;
    }
  }
}
