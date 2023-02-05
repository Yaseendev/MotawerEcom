import 'package:flutter/material.dart';

class SliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 110 ||
        oldDelegate.minExtent != 110 ||
        child != oldDelegate.child;
  }
}
