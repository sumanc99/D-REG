import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primary,
              fontSize: 29.sp,
            ),
        textAlign: TextAlign.left,
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.all(AppSpacing.sm),
          child: Image.asset(
            'assets/teacher.png',
            height: 40.h,
            width: 40.w,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}