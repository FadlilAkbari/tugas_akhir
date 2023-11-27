import 'package:flutter/material.dart';
import 'package:projek/helper/hiveDatabase.dart';
import 'package:projek/model/dataModel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final HiveDatabase _hive = HiveDatabase();

  var encryptedText,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register", style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
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
                'Create Your\nAccount',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    _buildRegisterButton(),
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
              ),
            ),
          )
        ],
      )
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.all(10.0),
          fixedSize: Size(190,50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // <-- Radius
          ),
        ),
        child: Text(labelButton,style: TextStyle(fontFamily: 'Poppins',fontSize: 18,fontWeight: FontWeight.w700),),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }

  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Sign Up",

      submitCallback: (value) {
        if (_usernameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          _hive.addData(
              DataModel(
                  username: _usernameController.text,
                  password: _passwordController.text
              )

          );
          _usernameController.clear();
          _passwordController.clear();

          setState(() {
          });


          Navigator.pop(context);
        }
      },
    );
  }
}

