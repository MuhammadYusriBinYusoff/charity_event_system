import 'package:charity_event_system/common/common.dart';
import 'package:charity_event_system/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Translation.forgetPassword.getString(context)),
      //endDrawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              Translation.pleaseEnterEmail.getString(context),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          SpacerV(value: Dimens.space16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: Translation.loginEmail.getString(context),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return Translation.pleaseEnterEmail.getString(context);
                }
                if (!isValidEmail(value)) {
                  return Translation.emailResetPasswordTitle.getString(context);
                }
                return null;
              },
            ),
          ),
          SpacerV(value: Dimens.space16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Palette.purpleMain),
              ),
              onPressed: () {
                _resetPassword(context);
              },
              child: Text(
                Translation.resetPassword.getString(context),
                style: const TextStyle(color: Palette.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword(BuildContext context) {
    String email = _emailController.text.trim();

    // Check if the email is valid
    if (email.isEmpty || !isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Translation.emailResetPasswordTitle.getString(context)),
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    // Send password reset email using Firebase Authentication
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Translation.successEmailMsg.getString(context)),
          duration: const Duration(seconds: 3),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text( '${Translation.errorEmailMsg.getString(context)}: $error'),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }

  bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }
}
