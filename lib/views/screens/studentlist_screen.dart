import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class Student {
  final String gender;
  final String studentName;
  final String status;

  Student(this.gender, this.studentName, this.status);
}

class _StudentListScreenState extends State<StudentListScreen> {
  final List<Student> history = [
    Student('male', 'Suman Luigi Sulaiman', 'Present'),
    Student('female', 'Maty BigHead', 'Absent'),
    Student('female', 'Jane Smith', 'Present'),
    Student('male', 'Sulaiman Saleh Yahya ', 'Present'),
    Student('male', 'Ali Musa', 'Absent'),
    Student('female', 'Maryam Bello', 'Present'),
  ];



  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(AppSpacing.md.r),
        child: Column(
          children: [
            // Search Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by full name',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black54),
                prefixIcon: Icon(Icons.search, color: AppColors.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.borderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.primary, width: 2.w),
                ),
                filled: true,
                fillColor: AppColors.fieldFillLight,
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: AppSpacing.md.h),
            
            // Student List
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final student = history[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)),
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: AppSpacing.md),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                      leading: Image.asset(
                        'assets/${student.gender}.png',
                        height: 40.h,
                        width: 40.w,
                      ),
                        title: Text(
                          student.studentName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.black87, 
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                        ),
                        
                       
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}
