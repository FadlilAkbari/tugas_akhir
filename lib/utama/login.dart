import 'package:flutter/material.dart';
import 'package:projek/utama/homepage.dart';
import 'package:projek/helper/hiveDatabase.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.purple,
                Colors.white,
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Hello\nSign in!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              key: _formKey,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Gmail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )),
                      validator: (value) =>
                      value!.isEmpty ? 'Username cannot be blank' : null,
                    ),
                    Padding(padding: const EdgeInsets.only(bottom: 10)),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                          label: Text('Password',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color:Colors.black,
                          ),)
                      ),
                      obscureText: true,
                      validator: (value) =>
                      value!.isEmpty ? 'Password cannot be blank' : null,
                    ),
                    Padding(padding: const EdgeInsets.only(bottom: 30)),
                    _buildLoginButton(),
                    Padding(padding: const EdgeInsets.all(3)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'\ t Have An Account?',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.black),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),
          ),
        ],
      )

    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.all(10.0),
          fixedSize: Size(190, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // <-- Radius
          ),
        ),
        child: Text(labelButton,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            )),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }

  Widget _buildLoginButton() {
    return _commonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        validateAndSave();
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    found = _hive.checkLogin(username, password);

    if (!found)
      showAlertDialog(context);
    else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        backgroundColor: Colors.black,
        content: Text(
          "Login Success!",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(15),
      ),
      title: Text(
        "Login Failed!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
