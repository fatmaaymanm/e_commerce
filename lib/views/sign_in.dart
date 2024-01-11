import 'package:e_commerce/views/shop.dart';
import 'package:e_commerce/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidden = true;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Icon(
                    Icons.shopify,
                    color: Colors.redAccent,
                    size: 120,
                  ),
                ),
                const Center(
                  child: Text(
                    "E-commerce",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.redAccent),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value != null &&
                          (value.length < 9 || value.length >= 13)) {
                        return 'Invalid Phone Number';
                      }
                    },
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: passController,
                    validator: (value) {
                      if (value != null &&
                          (value.length < 8 || value.length >= 16)) {
                        return 'Invalid Password';
                      }
                    },
                    obscureText: hidden,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          togglePassword();
                        },
                        icon: Icon(
                            hidden ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () async {
                      debugPrint(phoneController.text);
                      debugPrint(passController.text);
                      if (_formKey.currentState!.validate()) {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('phone', phoneController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Shop()),
                        );
                      } else {
                        SnackBar snackBar = SnackBar(
                          content: const Text('Enter valid data'),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Center(child: Text('Not a member?')),
                Center(
                  child: TextButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  togglePassword() {
    hidden = !hidden;
    setState(() {});
  }
}
