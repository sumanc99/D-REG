import 'package:d_reg/viewmodels/teacher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
   
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access the theme for consistent styling
    final textTheme = Theme.of(context).textTheme;
    final viewModel = context.watch<TeacherViewModel>();
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Adds space from the top of the screen
            SizedBox(height: (AppSpacing.xl*2).h),

            // App Logo
            Center(
              child: Image.asset(
                'assets/DREG.png',
                width: 300.w, // Optional: set width
                height: 300.h, // Optional: set height
                fit: BoxFit.cover, // Optional: adjust how the image fits
              ),
            ),

            // Motto
            Text(
              'Simplicity is Beauty',
              style: textTheme.displayLarge!.copyWith(
                fontSize: 32.sp,),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSpacing.lg.h),
            
            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration:  InputDecoration(
                hintText: 'Password',
                errorText: viewModel.passwordError,
              ),
              onChanged: viewModel.validatePassword,
            ),

           

            SizedBox(height: AppSpacing.lg.h),
            if(viewModel.loading) ...[
              const Center(child: CircularProgressIndicator()),
            ]else ...[
               ElevatedButton(
                onPressed: ()async {
                  final bool success = await viewModel.loginTeacher(
                    password: _passwordController.text.trim());

                  if(success && mounted){
                      Navigator.pushReplacementNamed(context, "/main");
                  }
                },
                child: const Text('Login'),
              ),
            ]
            // Login Button
           

          ],
        ),
      ),
    );
  }
}