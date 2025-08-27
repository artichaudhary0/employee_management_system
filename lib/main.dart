import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/repositories/employee_repository.dart';
import 'presentation/bloc/employee_bloc.dart';
import 'presentation/pages/employee_list_page.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_colors.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => EmployeeBloc(EmployeeRepository()),
          child: MaterialApp(
            title: 'Employee Management System',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Roboto',
              scaffoldBackgroundColor: AppColors.scaffold,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textOnPrimary,
                elevation: 0,
              ),
            ),
            initialRoute: AppRoutes.employeeList,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}