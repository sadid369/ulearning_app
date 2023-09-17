import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 327.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 345.w,
                        height: 345.h,
                        child: const Text("Image one"),
                      ),
                      Container(
                        child: Text(
                          'First See Learning',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30.w, right: 30.w),
                        child: Text(
                          'Forget about a for of paper all knowledge in one learning!',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 100.h,
                          left: 25.w,
                          right: 25.w,
                        ),
                        width: 325.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.w),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
