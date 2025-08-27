import '../models/employee.dart';
import '../datasources/database_helper.dart';

class EmployeeRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Employee>> getAllEmployees() async {
    return await _databaseHelper.getAllEmployees();
  }

  Future<int> addEmployee(Employee employee) async {
    return await _databaseHelper.insertEmployee(employee);
  }

  Future<int> updateEmployee(Employee employee) async {
    return await _databaseHelper.updateEmployee(employee);
  }

  Future<int> deleteEmployee(int id) async {
    return await _databaseHelper.deleteEmployee(id);
  }
}