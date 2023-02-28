import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powstik/ui/theme/theme_constants.dart' as theme;

class SignUpScreen extends StatefulWidget{
  static const String signUpScreen = 'SignUpScreen';
  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen>{

  late String _email;
  late String _password;
  bool _isVendor = false;
  bool _isSeller = false;


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
                    "REGISTER",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isVendor,
                          // Set the initial value of the checkbox
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              _isVendor = newValue;
                              newValue? (_isSeller = !newValue):null;
                              setState(() {});
                            }
                          },
                        ),
                        const Text('I\'m a Vendor'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isSeller,
                          // Set the initial value of the checkbox
                          onChanged: (bool? newValue) {
                            if (newValue != null) {
                              _isSeller = newValue;
                              newValue? (_isVendor = !newValue):null;
                              setState(() {});
                            }
                          },
                        ),
                        const Text('I\'m a Seller'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 75),
                child: ElevatedButton(
                  onPressed: () {
                    // Your code here
                  },
                  style: ButtonStyle(
                    //side: MaterialStateProperty.all(BorderSide(color: Colors.red)),
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      'SIGN UP',
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
}
