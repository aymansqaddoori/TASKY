import 'package:flutter/material.dart';
import 'package:to_do/models/shared/cubit/cubit.dart';
import 'package:to_do/models/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/models/shared/component/build_task_Items.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context)
          ..readData('SELECT * FROM tasks WHERE status="Waiting"');
        return Expanded(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  buildTaskItem(cubit.tasks[index]),
              separatorBuilder: (context, index) => Container(
                    width: 1.0,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
              itemCount: cubit.tasks.length),
        );
      },
    );
  }
}
