import 'package:class_k/Component/CustomTextField.dart';
import 'package:class_k/Component/EmailField.dart';
import 'package:class_k/Component/PasswordField.dart';
import 'package:class_k/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utils/Utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                EmailField(),
                SizedBox(height: 30,),
                PasswordField(),
                SizedBox(height: 50,),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            'Get started',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded,size: 35,)
                      ],
                    ),
                    onPressed: (){
                      startActivityAndFinishCurrent(context,App());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}



