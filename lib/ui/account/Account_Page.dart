import 'package:class_k/Component/CustomSliverHeaderAppbar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: Customsliverheaderappbar(
              childBuilder: (BuildContext context, double shrinkOffset, bool overlapsContent) {
                return Container(
                  color: Colors.blue,
                );
              }
          ),
        )
      ],
    );
  }

  Padding _paddingBuider({required Widget child}){
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: child,
    );
  }

}
