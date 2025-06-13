import 'package:dictionary/presentation/screens/splash_screen.dart';
import 'package:dictionary/presentation/widgets/custom_fields/fields_decoration.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController passwordConfirmTextController = TextEditingController();
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
                  Text(
                    "cadastre-se".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                  ),
                  Column(
                    spacing: 30,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: emailTextController,
                        decoration: FieldsDecoration('email', Icon(Icons.mail)),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        controller: passwordTextController,
                        decoration: FieldsDecoration(
                          'senha',
                          Icon(Icons.visibility),
                        ),
                        //keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                      TextFormField(
                        controller: passwordConfirmTextController,
                        decoration: FieldsDecoration(
                          'senha',
                          Icon(Icons.visibility),
                        ),
                        //keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SplashScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'cadastrar'.toUpperCase(),
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
