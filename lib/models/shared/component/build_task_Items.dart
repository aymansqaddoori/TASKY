import 'package:flutter/material.dart';
import 'package:to_do/models/shared/component/tasks_details.dart';
import 'package:to_do/models/shared/cubit/cubit.dart';
import 'package:to_do/models/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String dropdownValue = 'Inpogress';
Widget buildTaskItem(Map model) => BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        var cubit = AppCubit.get(context);
        double width = MediaQuery.of(context).size.width;

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TasksDetails(
                          model: model,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 10.0, right: 5.0, left: 5.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://dcassetcdn.com/design_img/1187964/510125/510125_6324794_1187964_406face0_image.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  Container(
                    width: width * 0.60,
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${model['title']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text(
                          '${model['description']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.0, color: Colors.grey[600]),
                        ),
                        SizedBox(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${model['priority']}',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey[600]),
                              ),
                              Text(
                                '${model['date']}',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${model['status']}',
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        width: 70.0,
                        child: DropdownButton(
                          icon: const Icon(Icons.more_vert),
                          onChanged: (String? newValue) {
                            dropdownValue = newValue!;
                            cubit.updateData(newValue, model['id']);
                            cubit.intialDb();
                            cubit.readData('SELECT * FROM tasks');
                            if (newValue == 'Delete') {
                              cubit.deleteData(model['id']);
                              cubit.intialDb();
                              cubit.readData('SELECT * FROM tasks');
                            }
                          },
                          items: <String>[
                            'Inpogress',
                            'Waiting',
                            'Finished',
                            'Delete',
                          ].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          isExpanded: true,
                          underline: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
