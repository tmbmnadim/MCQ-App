// import 'package:firebase_auth/firebase_auth.dart';
import 'package:engineeringexamgroup/Screens/Admin/admin_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../const_data.dart';
import '../../custom_widgets/icon_logo.dart';
import '../../custom_widgets/my_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UtilManager utilManager = UtilManager();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool switchOn = false;
  bool obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: screenSize.height * 0.9,
              width: screenSize.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: rowColumn(
                  screenSize: screenSize,
                  children: [
                    titleLogo(screenSize),
                    const SizedBox(height: 10),
                    signInForm(
                        screenSize:
                            Size(widgetWidth(screenSize), screenSize.height)),
                    const SizedBox(height: 20),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       width: 150,
                    //       child: Divider(
                    //         color: Color.fromARGB(70, 50, 194, 122),
                    //         thickness: 2,
                    //       ),
                    //     ),
                    //     Text("Or"),
                    //     SizedBox(
                    //       width: 150,
                    //       child: Divider(
                    //         color: Color.fromARGB(70, 50, 194, 122),
                    //         thickness: 2,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // extraSignIn(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget titleLogo(Size screenSize) {
    return SizedBox(
      width: widgetWidth(screenSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(
            size: widgetWidth(screenSize) * 0.3,
          ),
          const SizedBox(height: 10),
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: widgetWidth(screenSize) * 0.06,
              color: const Color.fromARGB(255, 93, 93, 93),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget rowColumn({required Size screenSize, required List<Widget> children}) {
    if (widgetWidth(screenSize) <= screenSize.width * 0.5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget signInForm({required Size screenSize}) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: widgetWidth(screenSize),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Sign in to your account",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 50),
            utilManager.customTextField(
              labelText: "Email",
              hintText: "example@mail.com",
              prefixIcon: const Icon(Icons.email_outlined),
              controller: emailController,
              hintColor: Colors.black54,
              labelColor: Colors.black54,
              fillColor: bgOffWhite,
              enabledBorderColor: Colors.transparent,
              focusedColor: mainColor,
              validator: (value) => _validateInput(value, "Email"),
            ),
            const SizedBox(height: 10),
            utilManager.customTextField(
              labelText: "Password",
              hintText: "Use Alphabets, Numbers and Signs.",
              controller: passwordController,
              hintColor: Colors.black54,
              labelColor: Colors.black54,
              fillColor: bgOffWhite,
              enabledBorderColor: Colors.transparent,
              focusedColor: mainColor,
              prefixIcon: const Icon(Icons.lock_outline),
              obscureText: obscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (value) => _validateInput(value, "Password"),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: widgetWidth(screenSize),
              child: RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  text: "Forgot Password?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: mainColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            utilManager.customTextButton(
              buttonText: "Login",
              width: widgetWidth(screenSize),
              textColor: Colors.white,
              splashColor: Colors.white,
              color: mainColor,
              borderRadius: 10,
              onTap: () async {
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPage()));
                //   try {
                //     EasyLoading.show(status: "Signing in...");
                //     UserCredential user = await _auth.signInWithEmailAndPassword(
                //       email: emailController.text,
                //       password: passwordController.text,
                //     );
                //     EasyLoading.dismiss();
                //     if (user.user != null) {
                //       EasyLoading.showSuccess('Signed in');
                //       emailController.clear();
                //       passwordController.clear();
                //       // if (context.mounted) {
                //       //   Navigator.pushAndRemoveUntil(
                //       //       context,
                //       //       MaterialPageRoute(
                //       //         builder: (context) => const SplashScreen(),
                //       //       ),
                //       //       ModalRoute.withName('/'));
                //       // }
                //     }
                //   } on FirebaseAuthException catch (error) {
                //     if (error.code == 'wrong-password') {
                //       EasyLoading.showError('Please type correct password');
                //     } else if (error.code == 'user-not-found') {
                //       EasyLoading.showError('No user with this email!');
                //     } else if (error.code == 'INVALID_LOGIN_CREDENTIALS') {
                //       EasyLoading.showError(
                //           'Please, input correct credentials or Sign Up');
                //     } else {
                //       EasyLoading.showError(error.code.toString());
                //     }
                //   } catch (e) {
                //     EasyLoading.showError("Sign In Exception:$e");
                //   }
                // }
              },
            ),
            // const SizedBox(height: 10),
            // RichText(
            //   text: TextSpan(
            //     text: "Don't have an account? ",
            //     style: const TextStyle(
            //       fontSize: 16,
            //       color: Colors.black,
            //     ),
            //     children: [
            //       TextSpan(
            //         text: "Sign Up",
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           color: mainColor,
            //         ),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             // Navigator.pushReplacement(
            //             //   context,
            //             //   MaterialPageRoute(
            //             //     builder: (context) => const SignUpScreen(),
            //             //   ),
            //             // );
            //           },
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget extraSignIn() {
  //   return SizedBox(
  //     width: 300,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         utilManager.customButton(
  //           width: 80,
  //           height: 80,
  //           color: bgOffWhite,
  //           splashColor: mainColorDarker,
  //           child: Image.asset(
  //             "images/apple.png",
  //             scale: 3,
  //           ),
  //           onTap: () async {
  //             // try {
  //             //   EasyLoading.show(status: "Signing in...");
  //             //   await signInWithGoogle();
  //             //   EasyLoading.dismiss();
  //             // } catch (e) {
  //             //   EasyLoading.showError(e.toString());
  //             // }
  //           },
  //         ),
  //         utilManager.customButton(
  //           width: 80,
  //           height: 80,
  //           color: bgOffWhite,
  //           splashColor: mainColorDarker,
  //           child: Image.asset(
  //             "images/google.png",
  //             scale: 3,
  //           ),
  //           onTap: () async {
  //             // try {
  //             //   EasyLoading.show(status: "Signing in...");
  //             //   await signInWithGoogle();
  //             //   EasyLoading.dismiss();
  //             //   if (context.mounted) {
  //             //     GoToPageProvider().goToPage(context, page: const AuthPage());
  //             //   }
  //             // } catch (e) {
  //             //   EasyLoading.showError(e.toString());
  //             // }
  //           },
  //         ),
  //         utilManager.customButton(
  //           width: 80,
  //           height: 80,
  //           color: bgOffWhite,
  //           splashColor: mainColorDarker,
  //           child: Image.asset(
  //             "images/facebook.png",
  //             scale: 2.2,
  //           ),
  //           onTap: () async {
  //             // try {
  //             //   EasyLoading.show(status: "Signing in...");
  //             //   await signInWithGoogle();
  //             //   EasyLoading.dismiss();
  //             // } catch (e) {
  //             //   EasyLoading.showError(e.toString());
  //             // }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  double widgetWidth(Size screenSize) {
    if (screenSize.width >= (screenSize.height * (4 / 5)) &&
        screenSize.width < (screenSize.height * (4 / 5)) * 2) {
      return (screenSize.height * (4 / 5));
    } else if (screenSize.width >= (screenSize.height * (4 / 5)) * 2) {
      return screenSize.width * 0.4;
    }
    return screenSize.width;
  }

  String? _validateInput(String? value, String field) {
    if (value == null || value.isEmpty) {
      return '$field is required.';
    } else if (field == 'Email' && !isValidEmail(value)) {
      return 'Please enter a valid email address.';
    } else if (field == 'Password' && !isValidPassword(value)) {
      return 'Password must contain both letters and numbers.';
    }
    return null;
  }

  bool isValidEmail(String email) {
    // Use a regex pattern to validate the email format.
    const emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Replace this with your password validation logic.
    // This example requires at least one letter and one number.
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    return hasLetter && hasNumber;
  }
}
