import 'package:d_reg/viewmodels/teacher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart'; // Make sure this is the correct path to your theme file
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _classNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // @override
  // void dispose() {
  //   _passwordController.dispose();
  //   _confirmPasswordController.dispose();
  //   _classNameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Access the theme for consistent styling
    final textTheme = Theme.of(context).textTheme;
    final viewModel = context.watch<TeacherViewModel>();

    return Scaffold(
      // The background color will be handled by the theme
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adds space from the top of the screen
            SizedBox(height: AppSpacing.xl.h),
             // App Logo
            Center(
              child: Image.asset(
                'assets/DREG.png',
                width: 300.w, // Optional: set width
                height: 300.h, // Optional: set height
                fit: BoxFit.cover, // Optional: adjust how the image fits
              ),
            ),

            // Screen title
            Text(
              'Class Registration',
              style: textTheme.displayLarge!.copyWith(
                fontSize: 32.sp,),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSpacing.lg.h),

            // Class Name Field
            TextField(
              controller: _classNameController,
              decoration: InputDecoration(
                labelText: 'ClassName',
                errorText: viewModel.classNameError,
              ),
              onChanged: viewModel.validateClassName,
            ),

            SizedBox(height: AppSpacing.xl.h),

            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: viewModel.passwordError,
              ),
              onChanged: viewModel.validatePassword,
            ),

            SizedBox(height: AppSpacing.xl.h),

            // Confirm Password Field
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText: viewModel.confirmPasswordError,
              ),
              onChanged: viewModel.validateConfirmPassword,
            ),

            SizedBox(height: AppSpacing.lg.h),
            if(viewModel.loading) ...[
              const CircularProgressIndicator(),
            ]else ...[
               // Continue Button
              ElevatedButton(
                onPressed: () async{
                  final bool success = await viewModel.registerTeacher(
                    className: _classNameController.text.trim(), 
                    password: _passwordController.text.trim(), 
                    confirmPassword: _confirmPasswordController.text.trim(),
                  );
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Registration in progress...'),
                  //   ),
                  // );

                  if(success && mounted){
                    Navigator.pushReplacementNamed(context, "/login");
                  }
                },
                child: const Text('Continue'),
              ),
            ],
           
            //  SizedBox(height: AppSpacing.xl.h),
            
          ],
        ),
      ),
    );
  }
}