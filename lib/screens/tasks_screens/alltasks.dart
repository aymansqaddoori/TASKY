import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/models/shared/cubit/cubit.dart';
import 'package:to_do/models/shared/cubit/states.dart';
import 'package:to_do/models/shared/component/build_task_Items.dart';

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
        create: (BuildContext context) =>
            AppCubit()..readData('SELECT * FROM tasks'),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates states) {},
          builder: (BuildContext context, AppStates states) {
            var cubit = AppCubit.get(context);
            return Expanded(
              child: SizedBox(
                width: width,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => SizedBox(
                        width: width, child: buildTaskItem(cubit.tasks[index])),
                    separatorBuilder: (context, index) => Container(
                          width: 1.0,
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                    itemCount: cubit.tasks.length),
              ),
            );
          },
        ));
  }
}
