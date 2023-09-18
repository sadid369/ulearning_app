import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_event.dart';

import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      // state.page = index;
                      context
                          .read<WelcomeBloc>()
                          .add(WelcomeEvent(index: index));
                    },
                    children: [
                      _page(
                          index: 1,
                          context: context,
                          buttonName: 'next',
                          title: 'First See Learning',
                          subTitle:
                              'Forget about a for of paper all knowledge in one learning!',
                          imagePath: "assets/images/reading.png"),
                      _page(
                          index: 2,
                          context: context,
                          buttonName: 'next',
                          title: 'Connect With Everyone',
                          subTitle:
                              'Always keep in touch with tutor & friends. Lets get connected',
                          imagePath: "assets/images/boy.png"),
                      _page(
                          index: 3,
                          context: context,
                          buttonName: 'get Started',
                          title: 'Always Fascinated Learning',
                          subTitle:
                              'Anywhere, anytime. The time is at our discretion so study whenever you want',
                          imagePath: "assets/images/man.png"),
                    ],
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(title: title);
                },
              ));
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
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
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
