import 'package:erp/screens/auth/registration_screen.dart';
import 'package:erp/screens/main/main_dashboard.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/Ellipse 52.png', // Replace your logo here
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.png', // Replace your logo here
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: size.height * 0.04),

          // Email Field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: TextFormInputFeildWidget(
              hintText: "Email Address",
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
          ),

          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => MainDashboard()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: colorWhite),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.025),

          // Forget password
          TextButton(
            onPressed: () {},
            child: Text(
              "Forget User / Password ?",
              style: TextStyle(color: forgotPasswordColor, fontSize: 15),
            ),
          ),

          SizedBox(height: size.height * 0.015),

          // Fingerprint
          Icon(
            Icons.fingerprint,
            size: size.width * 0.18,
            color: fingerPrintColor,
          ),

          // Bottom background + Signup
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to sign up
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => RegistrationScreen()),
                );
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(color: forgotPasswordColor, fontSize: 15),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: colorBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
