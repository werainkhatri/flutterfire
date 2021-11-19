import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_ui/auth.dart';
import 'package:flutter/material.dart';

import 'sms_code_input_screen.dart';

class PhoneInputScreen extends StatelessWidget {
  final AuthAction? action;
  final FirebaseAuth? auth;

  const PhoneInputScreen({
    Key? key,
    this.action,
    this.auth,
  }) : super(key: key);

  void next(BuildContext context, AuthAction? action, Object flowKey, _) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SMSCodeInputScreen(
          action: action,
          flowKey: flowKey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final flowKey = Object();

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: PhoneInputView(
            flowKey: flowKey,
            onSMSCodeRequested: next,
          ),
        ),
      ),
    );
  }
}