import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:to_do/models/shared/component/build_task_Items.dart';
import 'package:to_do/models/shared/component/constant.dart';
import 'package:to_do/widgets/color.dart';
import 'package:to_do/widgets/text_form.dart';

bool edit = false;

class TasksDetails extends StatefulWidget {
  final String dropdownValue = '';

  final Map? model;
  const TasksDetails({super.key, this.model});

  @override
  State<TasksDetails> createState() => _TasksDetailsState();
}

class _TasksDetailsState extends State<TasksDetails> {
  Map? model;

  @override
  void initState() {
    model = widget.model;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Task Details',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 25.0),
              width: 100,
              child: DropdownButton(
                icon: const Icon(Icons.more_vert),
                onChanged: (String? newValue) {
                  dropdownValue = newValue!;
                  if (dropdownValue == 'Edit') {
                    setState(() {
                      edit = true;
                    });
                  } else {
                    setState(() {
                      edit = false;
                    });
                  }
                },
                items: <String>[
                  'Edit',
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
          ]),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          width: MyUtility(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //imaggggggggggggggggggggge
              Center(
                child: Image.asset(
                  'assets/images/grocery.png',
                  width: MyUtility(context).width,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //titleeeeeeeeeeeeeeeeeeeeeeeee
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                width: MyUtility(context).width,
                child: Text('${model!['title']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 5.0,
              ),
              //descriptionnnnnnnnnnnnnnnnnnnnnn
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                width: MyUtility(context).width,
                child: Text(
                  '${model!['description']}',
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              //date fieldddddddddddddddddddddddddd
              SizedBox(
                width: MyUtility(context).width,
                child: CustomTextField(
                  enabled: edit,
                  labelText: 'End Date',
                  controller: TextEditingController(text: model!['date']),
                  inputType: TextInputType.text,
                  readOnly: false,
                  obscureText: false,
                  fillColor: const Color(0xFFF0ECFF),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2025),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        TextEditingController().text =
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
              ),

              const SizedBox(
                height: 10.0,
              ),
              //statussssssssssssssssssssssssssssssss
              SizedBox(
                width: MyUtility(context).width,
                child: DropdownMenuL(
                  enabled: false,
                  initialSelection: model!['status'],
                  list: const [
                    'Inprogress',
                    'Waiting',
                    'Finished',
                  ],
                  fillColor: const Color(0xFFF0ECFF),
                  leadingIcon: const Icon(
                    Icons.priority_high_rounded,
                    color: AppColors.primaryColor,
                  ),
                  textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                  suffixIconColor: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //priorityyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
              SizedBox(
                width: MyUtility(context).width,
                child: DropdownMenuL(
                  enabled: false,
                  initialSelection: model!['priority'],
                  list: const [
                    'High Priority',
                    'Medium Priority',
                    'Low Priority'
                  ],
                  controller: TextEditingController(text: model!['priority']),
                  fillColor: const Color(0xFFF0ECFF),
                  leadingIcon: const Icon(
                    Icons.flag_outlined,
                    color: AppColors.primaryColor,
                  ),
                  textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                  suffixIconColor: AppColors.primaryColor,
                ),
              ),
              //qrrrrrrrrrrrrrrrrrrrrrrrrrrrr
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: QrImageView(
                  data: '${model!['id']}',
                  version: QrVersions.auto,
                  size: MyUtility(context).width * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
