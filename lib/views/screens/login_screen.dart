import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme for consistent styling
    final textTheme = Theme.of(context).textTheme;

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
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password'
              ),
            ),

           

            SizedBox(height: AppSpacing.lg.h),

            // Login Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logging in...'),
                  ),
                );
              },
              child: const Text('Login'),
            ),

          ],
        ),
      ),
    );
  }
}