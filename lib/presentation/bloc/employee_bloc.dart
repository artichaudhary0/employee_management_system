import 'package:employee_management_system/core/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/employee_repository.dart';
import 'employee_event.dart';
import 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

  EmployeeBloc(this._employeeRepository) : super(EmployeeInitial()) {
    on<LoadEmployees>(_onLoadEmployees);
    on<AddEmployee>(_onAddEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);
  }

  Future<void> _onLoadEmployees(
    LoadEmployees event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());
    try {
      final employees = await _employeeRepository.getAllEmployees();
      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError('Failed to load employees: ${e.toString()}'));
    }
  }

  Future<void> _onAddEmployee(
    AddEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    try {
      await _employeeRepository.addEmployee(event.employee);
      emit(const EmployeeOperationSuccess('Employee added successfully'));
      add(LoadEmployees());
    } catch (e) {
      emit(EmployeeError('Failed to add employee: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateEmployee(
    UpdateEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    try {
      await _employeeRepository.updateEmployee(event.employee);
      emit(const EmployeeOperationSuccess('Employee updated successfully'));
      add(LoadEmployees());
    } catch (e) {
      emit(EmployeeError('Failed to update employee: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteEmployee(
    DeleteEmployee event,
    Emitter<EmployeeState> emit,
  ) async {
    try {
      await _employeeRepository.deleteEmployee(event.employeeId);
      emit(const EmployeeOperationSuccess(AppConstants.employeeDeleted));
      add(LoadEmployees());
    } catch (e) {
      emit(EmployeeError('Failed to delete employee: ${e.toString()}'));
    }
  }
}
