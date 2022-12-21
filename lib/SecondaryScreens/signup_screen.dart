import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/Primary_Screens/Home_Screen.dart';
import 'package:taste_application/SecondaryScreens/login_screen.dart';

import '../provider_files/taste_provider.dart';

class TasteSignUpPage extends StatefulWidget {
  const TasteSignUpPage({super.key});

  @override
  State<TasteSignUpPage> createState() => _TasteSignUpPageState();
}

class _TasteSignUpPageState extends State<TasteSignUpPage> {
  var obscureTexthowPassword = true;
  var passwordIsTapped = false;
  var passowrdIsValid = false;
  FocusNode focusNode = FocusNode();
  var checkBoxValue = false;

  var passwordController = TextEditingController();
  var emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          margin: const EdgeInsets.only(top: 120, right: 30, left: 30),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: emailContoller,
                decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(fontSize: 20),
                    labelText: "Email",
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                    hintText: "Please Enter A Valid Email.",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary)),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (EmailValidator.validate(email!)) return null;
                  return "Enter A Valid Email !";
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    passwordIsTapped = hasFocus;
                  });
                },
                child: TextFormField(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  obscureText: obscureTexthowPassword,
                  focusNode: focusNode,
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(obscureTexthowPassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscureTexthowPassword = !obscureTexthowPassword;
                        });
                      },
                    ),
                    hintStyle: const TextStyle(fontSize: 15),
                    hintText: "Follow The rules down Below",
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (password) {
                    if (passowrdIsValid) return null;
                    return "Enter A Valid Passowrd !";
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: passwordIsTapped,
                child: FlutterPwValidator(
                    failureColor: Theme.of(context).colorScheme.primary,
                    controller: passwordController,
                    minLength: 6,
                    uppercaseCharCount: 1,
                    numericCharCount: 1,
                    specialCharCount: 1,
                    width: 400,
                    height: 150,
                    onSuccess: () {
                      setState(() {
                        passowrdIsValid = true;
                      });
                    },
                    onFail: () {
                      setState(() {
                        passowrdIsValid = false;
                      });
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Checkbox(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: checkBoxValue,
                  onChanged: (value) => setState(() {
                    checkBoxValue = value!;
                  }),
                ),
                title: Text(
                  "I agree to the Terms of Service and Privacy Policy",
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 15)),
                  onPressed: () {
                    if (passowrdIsValid) {
                      if (checkBoxValue) {
                        if (EmailValidator.validate(emailContoller.text)) {
                          context
                              .read<TasteProvider>()
                              .UserSignUpChecker(
                                  emailContoller.text, passwordController.text)
                              .then((value) => value.compareTo("True") == 1
                                  ? Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 800),
                                          transitionsBuilder: (_, a, __, c) =>
                                              FadeTransition(
                                                  opacity: a, child: c),
                                          pageBuilder: (_, __, ___) => const Material(
                                              child: TasteHomeScreen())))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Email Is Already used !"))));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Enter A valid Email")));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Someone Forgot To Check The Policy Box")));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Enter A Valid Password")));
                    }
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                                pageBuilder: (_, __, ___) =>
                                    Material(child: TasteLoginScreen())));
                      },
                      child: Text(
                        "Sign In",
                        style: Theme.of(context).textTheme.labelMedium,
                      ))
                ],
              )
            ]),
          )),
    );
  }
}
