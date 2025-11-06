import 'package:assignment/services/authentication_service.dart';
import 'package:assignment/utils/images.dart';
import 'package:assignment/views/authentication_screen/login_screen.dart';
import 'package:assignment/views/authentication_screen/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isAgreed = false;
 final AuthenticationService authService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191842),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Image.asset(
                Images.logo,
                fit: BoxFit.fill,
                color: Colors.white,
                scale: 2,
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    customTextField(
                      title: "Name",
                      hintText: "Enter your name",
                      controller: nameController,
                    ),
                    SizedBox(height: 12.h),

                    customTextField(
                      title: "Company Name",
                      hintText: "Enter your company name",
                      controller: companyController,
                    ),
                    SizedBox(height: 12.h),

                    customTextField(
                      title: "Email Address",
                      hintText: "Enter your email address",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 12.h),

                    customTextField(
                      title: "Password",
                      hintText: "Enter your password",
                      controller: passwordController,
                    ),
                    SizedBox(height: 12.h),

                    customTextField(
                      title: "Confirm Password",
                      hintText: "Enter your password",
                      controller: confirmPasswordController,
                    ),
                    SizedBox(height: 16.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(activeColor: Colors.red,
                          value: isAgreed,
                          onChanged: (value) {
                            setState(() {
                              isAgreed = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text:
                                  "By signing up you are agreeing with the FFE ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                              children: [
                                TextSpan(
                                  text: "Terms & Conditions",
                                  style: TextStyle(color: Colors.red),
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.sp),
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async{
                              if (isAgreed) {
                                authService.registerUser(
                                  name: nameController.text.trim(),
                                  company: companyController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  confirmPassword: confirmPasswordController.text.trim(),
                                  context: context,
                                );
                              } else {
                                Fluttertoast.showToast(msg: "Please agree to Terms & Conditions");                               
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10.sp),
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account? ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign in here.",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
