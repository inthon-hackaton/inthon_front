import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? errorMessage;
  const ErrorPage({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(errorMessage ?? 'Unknown error occurred.'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
