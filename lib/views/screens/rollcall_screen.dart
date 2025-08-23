import 'package:flutter/material.dart';
import 'package:d_reg/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentRollCallScreen extends StatefulWidget {
  const StudentRollCallScreen({super.key});

  @override
  State<StudentRollCallScreen> createState() => _StudentRollCallScreenState();
}
 
class Student {
  final String name;
  final String avatarAsset;

  Student(this.name, this.avatarAsset);
}

class _StudentRollCallScreenState extends State<StudentRollCallScreen> {
  final List<Student> students = [
    Student('Suman Luigi', 'assets/male.png'),
    Student('Maty BigHead', 'assets/female.png'),
    Student('Jane Smith', 'assets/male.png'),
  ];
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: PageView.builder(
          controller: _pageController,
          itemCount: students.length,
          onPageChanged: (index) {
            setState(() {});
          },
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              elevation: 4,
              margin: EdgeInsets.all(AppSpacing.md.r),
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      students[index].avatarAsset,
                      width: 300.w,
                      height: 300.w,
                      fit: BoxFit.cover,
                    ),
                    
                    Text(
                      students[index].name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.black87,
                            fontSize: 29.r,
                            letterSpacing: 1.5,
                          ),
                      textAlign: TextAlign.center,
                      // 
                    ),
                    SizedBox(height: AppSpacing.lg.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE63946),
                            shape: CircleBorder(),
                            minimumSize: Size(60.w, 60.h),
                          ),
                          onPressed: () {
                            if (_pageController.page! < students.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _pageController.animateToPage(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Icon(Icons.close, color: Colors.white, size: 24.r),
                        ),
                        SizedBox(width: (AppSpacing.xl * 3).w),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF04AA6D),
                            shape: CircleBorder(),
                            minimumSize: Size(60.w, 60.h),
                          ),
                          onPressed: () {
                            if (_pageController.page! < students.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _pageController.animateToPage(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: Icon(Icons.check, color: Colors.white, size: 24.r),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}