import 'package:dictionary/presentation/screens/mainlayout/main_layout.dart';
import 'package:dictionary/presentation/screens/splash_screen.dart';
import 'package:dictionary/presentation/widgets/custom_fields/fields_decoration.dart';
import 'package:dictionary/core/routes/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool> obscurePassword = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                spacing: 80,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      Lottie.asset(
                        'assets/translatelottie.json',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        "dictionary".toUpperCase(),
                        style: TextStyle(color: Color(0xfff56e0f)),
                      ),
                    ],
                  ),
                  //Image.asset('assets/images/LOGO-GUARDIAO.png'),
                  Column(
                    spacing: 30,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: FieldsDecoration('email', Icon(Icons.mail)),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: obscurePassword,
                        builder: (
                          BuildContext obscureContext,
                          obscurePassword,
                          child,
                        ) {
                          return TextFormField(
                            decoration: FieldsDecoration(
                              'senha',
                              Icon(Icons.security),
                              IconButton(
                                onPressed: () {
                                  this.obscurePassword.value =
                                      !this.obscurePassword.value;
                                },
                                icon: Icon(
                                  obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            //keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: obscurePassword,
                          );
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(18),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color(0xff262626),
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            NamedRoute.main,
                            (Route route) => false,
                          );
                        },
                        child: Text(
                          'entrar'.toUpperCase(),
                          style: TextStyle(
                            color: Color(0xfffbfbfb),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(18),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Color(0xff878787),
                          ),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(NamedRoute.register);
                        },
                        child: Text(
                          'cadastre-se'.toUpperCase(),
                          style: TextStyle(
                            color: Color(0xfffbfbfb),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
