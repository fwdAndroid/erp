import 'package:erp/screens/auth/login_screen.dart';
import 'package:erp/services/auth_methods.dart';
import 'package:erp/uitl/colors.dart';
import 'package:erp/uitl/show_message_bar.dart';
import 'package:erp/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorWhite,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
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
                child: Text(
                  'Create Your Account', // Replace your logo here
                  style: TextStyle(color: buttonColor, fontSize: 30),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              // Name Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: TextFormInputFeildWidget(
                  hintText: "Name",
                  controller: nameController,
                  textInputType: TextInputType.emailAddress,
                ),
              ),

              SizedBox(height: size.height * 0.02),

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

              // Email Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: TextFormInputFeildWidget(
                  hintText: "Phone Number",
                  controller: phoneController,
                  textInputType: TextInputType.number,
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: TextField(
                        controller: passwordController,
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
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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
                  ),
                  // Fingerprint
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.fingerprint,
                      size: size.width * 0.10,
                      color: fingerPrintColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.02),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
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
                        onPressed: () async {
                          if (nameController.text.isEmpty) {
                            showMessageBar("User Name is Required", context);
                          } else if (emailController.text.isEmpty) {
                            showMessageBar("Email is Required", context);
                          } else if (phoneController.text.isEmpty) {
                            showMessageBar("Phone Number is Required", context);
                          } else if (passwordController.text.isEmpty) {
                            showMessageBar("Password is Required", context);
                          } else {
                            setState(() {
                              isLoading = true;
                            });

                            if (_formKey.currentState?.validate() ?? false) {
                              await AuthMethods().signUpUser(
                                context: context,
                                fullName: nameController.text.trim(),

                                email: emailController.text.trim(),

                                password: passwordController.text.trim(),

                                phoneNumber: phoneController.text.trim(),
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 18, color: colorWhite),
                        ),
                      ),
                    ),
                  ),

              SizedBox(height: size.height * 0.015),

              // Bottom background + Signup
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to sign up
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (builder) => LoginScreen()),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: forgotPasswordColor,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In",
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
        ),
      ),
    );
  }
}
