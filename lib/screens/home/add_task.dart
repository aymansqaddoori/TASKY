import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do/models/shared/cubit/cubit.dart';
import 'package:to_do/models/shared/cubit/states.dart';
import 'package:to_do/screens/home/home_screen.dart';
import 'package:to_do/widgets/app_button.dart';
import 'package:to_do/widgets/color.dart';
import 'package:to_do/widgets/text_form.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({
    super.key,
  });

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final TextEditingController dateController = TextEditingController();

  final TextEditingController title = TextEditingController();

  final TextEditingController descp = TextEditingController();

  final TextEditingController prio = TextEditingController();
  File? _selectedPhoto;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..intialDb(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates states) {},
            builder: (BuildContext context, AppStates states) {
              AppCubit cubit = AppCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Add new task',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: DottedBorder(
                          strokeWidth: 1,
                          color: AppColors.primaryColor,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [3, 3],
                          child: Container(
                            color: Colors.white,
                            width: width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //open cameraaaaaaaaaaaa
                                _selectedPhoto != null
                                    ? Image.file(
                                        _selectedPhoto!,
                                        width: width * 0.9,
                                        height: 150,
                                        fit: BoxFit.fill,
                                      )
                                    : Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _picImageFromCamera();
                                            },
                                            child: const Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 95.0,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50.0,
                                          ),
                                          // galleryyyyyyyyyyyyyy
                                          InkWell(
                                            onTap: () {
                                              _picImageFromGallery();
                                            },
                                            child: const Icon(
                                              Icons.image,
                                              size: 100.0,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Task title',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: title,
                        inputType: TextInputType.text,
                        obscureText: false,
                        hintText: 'Enter title here...',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Task Description',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: descp,
                        inputType: TextInputType.text,
                        obscureText: false,
                        hintText: 'Enter description here...',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                        maxLines: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Priority',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenuL(
                        list: const [
                          'High Priority',
                          'Medium Priority',
                          'Low Priority'
                        ],
                        controller: prio,
                        leadingIcon: const Icon(
                          Icons.flag_outlined,
                          color: AppColors.primaryColor,
                        ),
                        textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                        suffixIconColor: AppColors.primaryColor,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Due date',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: dateController,
                        inputType: TextInputType.text,
                        readOnly: true,
                        obscureText: false,
                        hintText: 'choose due date...',
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2025),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              dateController.text =
                                  selectedDate.toString().split(" ")[0];
                            }
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter date.';
                          }
                          return null;
                        },
                        suffixIcon: const Icon(
                          Icons.calendar_month,
                          size: 35.0,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: AppButton(
                          label: 'Add task',
                          onPressed: () {
                            cubit
                                .insertData(title.text, descp.text, prio.text,
                                    dateController.text)
                                .then((val) {})
                                .catchError((onError) {});

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  Future _picImageFromGallery() async {
    final returnedPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedPhoto == null) return;
    setState(() {
      _selectedPhoto = File(returnedPhoto.path);
    });
  }

  Future _picImageFromCamera() async {
    final returnedPhoto =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedPhoto == null) return;
    setState(() {
      _selectedPhoto = File(returnedPhoto.path);
    });
  }
}
