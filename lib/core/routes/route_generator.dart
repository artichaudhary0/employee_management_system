import 'package:flutter/material.dart';
import '../../data/models/employee.dart';
import '../../presentation/pages/employee_list_page.dart';
import '../../presentation/pages/add_edit_employee_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.employeeList:
        return MaterialPageRoute(builder: (_) => const EmployeeListPage());
      
      case AppRoutes.addEmployee:
        return MaterialPageRoute(builder: (_) => const AddEditEmployeePage());
      
      case AppRoutes.editEmployee:
        final employee = settings.arguments as Employee;
        return MaterialPageRoute(
          builder: (_) => AddEditEmployeePage(employee: employee),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}