import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/Primary_Screens/Home_Screen.dart';
import 'package:taste_application/SecondaryScreens/signup_screen.dart';

import '../provider_files/taste_provider.dart';

class TasteLoginScreen extends StatefulWidget {
  @override
  State<TasteLoginScreen> createState() => _TasteLoginScreenState();
}

class _TasteLoginScreenState extends State<TasteLoginScreen> {
  FocusNode focusNode = FocusNode();
  var obscureTexthowPassword = true;
  var passwordIsTapped = false;
  var passowrdIsValid = false;

  var passwordController = TextEditingController();
  var emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // ! Start Of first part (Logo  and TASTE title)
              ImageIcon(
                const AssetImage(
                  "Images/LogoIconNbg.png",
                ),
                size: 120,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                "Taste",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              // ! End Of first part (Logo  and TASTE title)
              // ! Start Of Second part (Login form)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hey There ! Happy To See You Again.",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      controller: emailContoller,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintStyle: const TextStyle(fontSize: 15),
                          hintText: "Enter Your Valid Email.",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary)),
                      keyboardType: TextInputType.emailAddress,
                      
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
                                obscureTexthowPassword =
                                    !obscureTexthowPassword;
                              });
                            },
                          ),
                          hintStyle: const TextStyle(fontSize: 15),
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        
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
                          context
                              .read<TasteProvider>()
                              .UserLoginChecker(
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
                                          content: Text("Wrong Email Or Password !"))));
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "or use one of your social profiles",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 29, 161, 242),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15)),
                              onPressed: () {},
                              icon: const Icon(EvaIcons.google),
                              label: const Text(
                                "Google",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 59, 89, 152),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15)),
                              onPressed: () {},
                              icon: const Icon(Icons.facebook),
                              label: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
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
                                          const Material(
                                              child: TasteSignUpPage())));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context).colorScheme.primary),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
