import 'package:clean_code_demo/presentation/profile_screen/view/profile_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SHREE  ",
                  style: TextStyle(fontFamily: "SuezOne", fontSize: 28, color: Colors.red),
                ),
                Text(
                  "IRA",
                  style: TextStyle(fontFamily: "SuezOne", fontSize: 28, color: Colors.yellow),
                ),
              ],
            ),
            Text(
              "EDUCATION",
              style: TextStyle(fontFamily: "SuezOne", fontSize: 28, color: Colors.red),
            ),
            SizedBox(height: size.width * .05),
            SizedBox(
              width: size.width * .8,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  label: const Row(
                    children: [
                      Text("Email address", style: TextStyle(color: Colors.grey)),
                      Text("*", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
                ),
                validator: (enteredEmail) {
                  if (EmailValidator.validate(enteredEmail!)) {
                    return "Enter Proper Email";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: size.width * .05),
            TextFormFieldWidget(
              size: size,
              passwordController: passwordController,
              label: 'Password',
              suffixText: "Forgot?",
            ),
            SizedBox(height: size.width * .08),
            ButtonWidget(
              size: size,
              width: .8,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              text: 'Sign in',
            ),
            Spacer(),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Not registered yet? ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "Sign up now", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500))
              ]),
            ),
            SizedBox(height: size.width * .08),
          ],
        ),
      ),
    );
  }
}
