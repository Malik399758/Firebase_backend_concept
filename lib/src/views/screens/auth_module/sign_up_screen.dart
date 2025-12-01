import 'dart:ffi';

import 'package:firebase_concept/src/components/app_text_style.dart';
import 'package:firebase_concept/src/components/widgets/black_text.dart';
import 'package:firebase_concept/src/components/widgets/custom_orange_button.dart';
import 'package:firebase_concept/src/components/widgets/custom_text_field.dart';
import 'package:firebase_concept/src/services/auth_service.dart';
import 'package:firebase_concept/src/views/screens/home_module/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthService authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool isLoading = false;

  void _handleSignUp()async{
    setState(() {
      isLoading = true;
    });
    final result = await authService.signUp(emailController.text.trim(), passwordController.text.trim());
    
    if(result == null){
      Get.snackbar('Success', 'Account Created Successfully',backgroundColor: Colors.green,colorText: Colors.white);
      Get.to(() => HomeScreen());
      setState(() {
        isLoading = false;
      });
    }else{
      Get.snackbar('Error', result ?? 'Error occurred',backgroundColor: Colors.red,colorText: Colors.white);
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlackText(txt: 'Sign up'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: AppTextStyle.poppins(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextField(hintText: 'Enter email',controller: emailController,),
              SizedBox(height: 20),
              Text(
                'Password',
                style: AppTextStyle.poppins(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextField(hintText: 'Enter password',controller: passwordController,),
              SizedBox(height: 20),
              CustomOrangeButton(txt: isLoading ? 'Loading...' : 'Sign up', onTap: _handleSignUp),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
