import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart'; // Make sure this is the correct path to your theme file
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme for consistent styling
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // The background color will be handled by the theme
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adds space from the top of the screen
            SizedBox(height: (AppSpacing.xl * 3).h),

            // Screen title
            Text(
              'Class Registration',
              style: textTheme.displayLarge!.copyWith(
                fontSize: 32.sp,),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSpacing.lg.h),

            // First Name Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'FirstName',
              ),
            ),

            SizedBox(height: AppSpacing.xl.h),

            // Last Name Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'LastName',
              ),
              
            ),

            SizedBox(height: AppSpacing.xl.h),

            // Class Name Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'ClassName',
              ),
            ),

            SizedBox(height: AppSpacing.xl.h),

            // Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),

            SizedBox(height: AppSpacing.xl.h),

            // Confirm Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),

            SizedBox(height: AppSpacing.lg.h),

            // Continue Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration in progress...'),
                  ),
                );
              },
              child: const Text('Continue'),
            ),

            const SizedBox(height: AppSpacing.md),
          ],
        ),
      ),
    );
  }
}