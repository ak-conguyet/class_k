
import 'package:class_k/ui/login/bloc/Login_Event.dart';
import 'package:class_k/ui/login/bloc/Login_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<Login_Event,Login_State>{

  LoginBloc():super(Login_initical()){
    on<Login_request>((event, emit) => _onLogin(event));
  }

  void _onLogin(Login_request event) async{
    emit(Login_loading());
    await Future.delayed(const Duration(seconds: 2));
    if(event.email != 'igg.anhkiet1@gmail.com'){
      emit(Login_failure('Email not found!'));
      return;
    }
    if(event.password != '123456'){
      emit(Login_failure('Password is wrong!'));
      return;
    }
    emit(Login_success());
  }

}