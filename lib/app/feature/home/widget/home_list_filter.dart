import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeListFilter extends StatelessWidget {
  const HomeListFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      sliver: SliverPinnedHeader(
        child: Container(
          // color: Colors.amber,
          height: 40,
          width: 100,
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
