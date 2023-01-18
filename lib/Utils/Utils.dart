import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

void startActivity(BuildContext context, Widget target){
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context,animation, secondaryAnimation) => target,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset(0,0);
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOutQuad));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    )
  );
}

void startActivityAndFinishCurrent(BuildContext context, Widget target){
  Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context,animation, secondaryAnimation) => target,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset(0,0);
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOutQuad));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      )
  );
}

// void openUri(String url) async {
//   if(await canLaunch(url)){
//     launch(url);
//   }else {
//     throw 'Can\'t launch $url';
//   }
// }