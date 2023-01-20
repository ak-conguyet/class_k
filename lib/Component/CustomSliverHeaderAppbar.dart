import 'package:flutter/material.dart';

typedef CustomChildBuilder = Widget Function(BuildContext context,double shrinkOffset,bool overlapsContent);
class Customsliverheaderappbar extends SliverPersistentHeaderDelegate {
  const Customsliverheaderappbar({this.height=400, required this.childBuilder});
  final double height;
  final CustomChildBuilder childBuilder;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: childBuilder(context,shrinkOffset,overlapsContent)
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => height;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
