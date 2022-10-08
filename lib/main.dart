import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retroflux/core/const.dart';
import 'package:retroflux/presentation/bloc/retroflux_bloc.dart';
import 'package:retroflux/presentation/ui/views/homepage_view.dart';
import 'package:retroflux/presentation/ui/views/log_view.dart';
import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // this one for android
      statusBarBrightness: Brightness.light // this one for iOS
      ));
  runApp(BlocProvider(
    create: (context) => ic.sl<RetrofluxBloc>(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return MaterialApp(
          title: 'Retroflux',
          theme: ThemeData(
            fontFamily: 'roboto',
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 16.sp,
                  color: CustomColors.gunMetal,
                  letterSpacing: 2,
                  fontFamily: 'bebas-neue'),
              headline2: TextStyle(
                  fontSize: 24.sp,
                  color: CustomColors.gunMetal,
                  fontFamily: 'poppins'),
              headline3: TextStyle(
                  fontSize: 16.sp,
                  color: CustomColors.gunMetal,
                  fontFamily: 'roboto-medium'),
              bodyText1:
                  TextStyle(fontSize: 12.sp, color: CustomColors.gunMetal),
              bodyText2: TextStyle(fontSize: 12.sp, color: Colors.white),
              subtitle1:
                  TextStyle(fontSize: 12.sp, color: CustomColors.dimGrey),
              subtitle2:
                  TextStyle(fontSize: 10.sp, color: CustomColors.dimGrey),
            ),
          ),
          home: const HomepageView(),
        );
      }),
    );
  }
}
