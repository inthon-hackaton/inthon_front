import 'package:flutter/material.dart';
import 'package:inthon_front/app/data/service/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: ShadButton(
                  onPressed: () {
                    RouterService.to.goRouter.go('/');
                  },
                  child: Text('계속하기'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
