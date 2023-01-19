import 'package:class_k/main.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

void startActivity(BuildContext context, Widget target){
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context,animation, secondaryAnimation) => target,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeInOutQuad));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      },
    )
  );
}

void startActivityAndFinishCurrent(BuildContext context, Widget target){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const App()));
}

// void openUri(String url) async {
//   if(await canLaunch(url)){
//     launch(url);
//   }else {
//     throw 'Can\'t launch $url';
//   }
// }