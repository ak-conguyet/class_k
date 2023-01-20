import 'package:equatable/equatable.dart';

abstract class Login_State extends Equatable{}

class Login_initical extends Login_State{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Login_loading extends Login_State{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Login_success extends Login_State{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Login_failure extends Login_State{

  final String text;

  Login_failure(this.text);

  @override
  // TODO: implement props
  List<Object?> get props => [text];
}

class Login_error extends Login_State{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}