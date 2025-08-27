import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/employee_list_widget.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/responsive/responsive_utils.dart';
import '../../core/routes/app_routes.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  void initState() {
    super.initState();
    context.read<EmployeeBloc>().add(LoadEmployees());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: const CommonAppBar(title: AppConstants.appTitle),
      body: BlocConsumer<EmployeeBloc, EmployeeState>(
        listener: (context, state) {
          if (state is EmployeeError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is EmployeeOperationSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EmployeeLoaded) {
            if (state.employees.isEmpty) {
              return const EmptyStateWidget();
            }
            return EmployeeListWidget(employees: state.employees);
          }

          return const EmptyStateWidget();
        },
      ),
      floatingActionButton: SizedBox(
        width: ResponsiveUtils.getResponsiveWidth(50),
        height: ResponsiveUtils.getResponsiveHeight(50),
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.addEmployee),
          backgroundColor: AppColors.primary,
          child: SvgPicture.asset(
            AppConstants.addIcon,
            width: ResponsiveUtils.getResponsiveWidth(18),
            height: ResponsiveUtils.getResponsiveHeight(18),
          ),
        ),
      ),
    );
  }
}
