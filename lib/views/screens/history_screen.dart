  import 'package:flutter/material.dart';
  import 'package:d_reg/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  class HistoryScreen extends StatefulWidget {
    const HistoryScreen({super.key});

    @override
    State<HistoryScreen> createState() => _HistoryScreenState();
  }

  class History {
    final String date;
    final int maleCount;
    final int feMaleCount;

    History(this.date, this.maleCount,this.feMaleCount);
  }

  class _HistoryScreenState extends State<HistoryScreen> {
    final List<History> history = [
      History('07/08/2018', 10, 10),
      History('07/08/2018', 1, 10),
      History('07/08/2018', 12, 10),
      History('07/08/2018', 10, 15),
      History('07/08/2018', 14, 10),
      History('07/08/2018', 10, 20),
      
    ];


    @override
    Widget build(BuildContext context) {
      return  Padding(
          padding: EdgeInsets.all(AppSpacing.md.r),
          child: Column(
            children: [
            
              
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
                        margin: EdgeInsets.only(bottom: AppSpacing.md.r),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg.w, vertical: AppSpacing.sm.h),
                    
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date: ${student.date}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.black87, 
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                              ), 
                              SizedBox(height: AppSpacing.xs),
                              Text(
                                'Male: ${student.maleCount}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.black87, 
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                              ),
                              SizedBox(height: AppSpacing.xs),
                              Text(
                                'Female: ${student.feMaleCount}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.black87, 
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                              ), 
                              SizedBox(height: AppSpacing.xs),
                              Text(
                                'Total Attendees: ${student.feMaleCount + student.maleCount}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.black87, 
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                      ),
                              ),
                            ],
                          ),
                          
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primary,
                          size: 36.r,
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
