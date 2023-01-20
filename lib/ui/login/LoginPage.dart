import 'package:class_k/Component/CustomBloc.dart';
import 'package:class_k/Component/EmailField.dart';
import 'package:class_k/Component/LodingWG.dart';
import 'package:class_k/Component/PasswordField.dart';
import 'package:class_k/Component/Style.dart';
import 'package:class_k/main.dart';
import 'package:class_k/ui/login/bloc/Login_Bloc.dart';
import 'package:class_k/ui/login/bloc/Login_Event.dart';
import 'package:class_k/ui/login/bloc/Login_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utils/Utils.dart';

class LoginPage extends CustomBloc<LoginBloc,Login_State> {
  LoginPage({super.key, required super.bloc});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Widget buildContent() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Welcome,',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Sign in to continue,',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black.withOpacity(0.6)
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                EmailField(
                  controller: _emailController,
                ),
                SizedBox(height: 30,),
                PasswordField(
                  controller: _passController,
                ),
                SizedBox(height: 50,),
                SizedBox(
                  height: 50,
                  child:ElevatedButton(
                    style: CustomButtonStyle(),
                    onPressed: (){
                      bloc.add(Login_request(_emailController.text, _passController.text));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Get started',
                          style: TextStyle(
                              fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded,size: 35,)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ),
        ),
      )
    );
  }
  
  @override
  Widget stateBuilder(Login_State state) {
    if(state is Login_loading){
      return LoadingWG();
    }

    if(state is Login_success){
      return LoadingWG();
    }

    if(state is Login_failure){
      return _failureBuild(state.text);
    }

    return buildContent();
  }

  Widget _failureBuild(String value)=>Scaffold(
    body: Center(
      child: Text(
        value
      ),
    ),
  );

  @override
  void listener(BuildContext context, Login_State state) {
    if(state is Login_success){
      startActivityAndFinishCurrent(context,const App());
    }
  }

  @override
  bool listennerWhen(Login_State state) {
    return true;
  }
}



