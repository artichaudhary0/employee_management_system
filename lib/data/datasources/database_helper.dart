import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/employee.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (kIsWeb) {
      throw UnsupportedError('SQLite not supported on web');
    }
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'employee_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employees(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        role TEXT NOT NULL,
        startDate INTEGER NOT NULL,
        endDate INTEGER
      )
    ''');
  }

  Future<int> insertEmployee(Employee employee) async {
    if (kIsWeb) {
      return await _insertEmployeeWeb(employee);
    }
    final db = await database;
    return await db.insert('employees', employee.toMap());
  }

  Future<List<Employee>> getAllEmployees() async {
    if (kIsWeb) {
      return await _getAllEmployeesWeb();
    }
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('employees');
    return List.generate(maps.length, (i) => Employee.fromMap(maps[i]));
  }

  Future<int> updateEmployee(Employee employee) async {
    if (kIsWeb) {
      return await _updateEmployeeWeb(employee);
    }
    final db = await database;
    return await db.update(
      'employees',
      employee.toMap(),
      where: 'id = ?',
      whereArgs: [employee.id],
    );
  }

  Future<int> deleteEmployee(int id) async {
    if (kIsWeb) {
      return await _deleteEmployeeWeb(id);
    }
    final db = await database;
    return await db.delete('employees', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> _insertEmployeeWeb(Employee employee) async {
    final prefs = await SharedPreferences.getInstance();
    final employees = await _getAllEmployeesWeb();
    final newId =
        employees.isEmpty
            ? 1
            : employees.map((e) => e.id!).reduce((a, b) => a > b ? a : b) + 1;
    final newEmployee = Employee(
      id: newId,
      name: employee.name,
      role: employee.role,
      startDate: employee.startDate,
      endDate: employee.endDate,
    );
    employees.add(newEmployee);
    await _saveEmployeesWeb(employees);
    return newId;
  }

  Future<List<Employee>> _getAllEmployeesWeb() async {
    final prefs = await SharedPreferences.getInstance();
    final employeesJson = prefs.getString('employees') ?? '[]';
    final List<dynamic> employeesList = json.decode(employeesJson);
    return employeesList.map((e) => Employee.fromMap(e)).toList();
  }

  Future<int> _updateEmployeeWeb(Employee employee) async {
    final employees = await _getAllEmployeesWeb();
    final index = employees.indexWhere((e) => e.id == employee.id);
    if (index != -1) {
      employees[index] = employee;
      await _saveEmployeesWeb(employees);
      return 1;
    }
    return 0;
  }

  Future<int> _deleteEmployeeWeb(int id) async {
    final employees = await _getAllEmployeesWeb();
    final initialLength = employees.length;
    employees.removeWhere((e) => e.id == id);
    await _saveEmployeesWeb(employees);
    return initialLength - employees.length;
  }

  Future<void> _saveEmployeesWeb(List<Employee> employees) async {
    final prefs = await SharedPreferences.getInstance();
    final employeesJson = json.encode(employees.map((e) => e.toMap()).toList());
    await prefs.setString('employees', employeesJson);
  }
}
