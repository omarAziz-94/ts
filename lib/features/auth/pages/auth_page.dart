import 'package:flutter/material.dart';
import 'package:parent/features/auth/widgets/auth_view.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = '/auth';

  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: AuthView(),
    );
  }
}
