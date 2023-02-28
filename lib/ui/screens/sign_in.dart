import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:powstik/ui/screens/home_screen.dart';
import 'package:powstik/ui/screens/sign_up.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;

class SignInScreen extends StatefulWidget {
  static const String signInScreen = 'SignInScreen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  late String _email;
  late String _password;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Powstik'),
        backgroundColor: theme.COLOR_PRIMARY,
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        color: theme.COLOR_PRIMARY,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 250,
                  ),
                ),
              ),
              const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    print("VALUE: $value");
                    _email = value!;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    print("VALUE: $value");
                    _password = value!;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          // Set the initial value of the checkbox
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              _rememberMe = newValue;
                              setState(() {});
                            }
                          },
                        ),
                        const Text('Remember me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Your code here
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 75),
                child: ElevatedButton(
                  onPressed: () {
                    (validateEmail(_email) && _email.length !=0)
                        ? _password.length > 6
                            ? Navigator.pushNamedAndRemoveUntil(context,
                                HomeScreenState.HomeScreen, (route) => false)
                            : Fluttertoast.showToast(
                                msg: "Invalid Password",
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0)
                        : Fluttertoast.showToast(
                            msg: "Invalid Email",
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 75),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.signUpScreen);
                  },
                  style: ButtonStyle(
                    //side: MaterialStateProperty.all(BorderSide(color: Colors.red)),
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      'SIGN UP ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    // Regular expression for email validation
    RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }
}
