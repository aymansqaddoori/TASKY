import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/models/shared/cubit/cubit.dart';
import 'package:to_do/models/shared/cubit/states.dart';
import 'package:to_do/screens/accounts/login_screen.dart';
import 'package:to_do/screens/home/add_task.dart';
import 'package:to_do/screens/home/profile_screen.dart';
import 'package:to_do/screens/home/qr.dart';
import 'package:to_do/widgets/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..readData('SELECT * FROM tasks'),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates states) {},
        builder: (BuildContext context, AppStates states) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Text(
                  'Logo',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy-Bold'),
                ),
              ),
              leadingWidth: 150.0,
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.person_2_outlined,
                      size: 25.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 30.0,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
            body: SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.menu_outlined,
                          size: 30.0,
                        ),
                        label: 'All',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.transfer_within_a_station,
                            size: 30.0,
                          ),
                          label: 'Inprogress'),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.watch_later_outlined,
                          size: 30.0,
                        ),
                        label: 'Waiting',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.done,
                          size: 30.0,
                        ),
                        label: 'Finished',
                      ),
                    ],
                    elevation: 5.0,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeIndex(index);
                    },
                  ),
                  cubit.screens[cubit.currentIndex],
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.2,
                  height: height * 0.1,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xffEBE5FF),
                    tooltip: 'QR',
                    shape: const CircleBorder(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QrScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.qr_code,
                      color: AppColors.primaryColor,
                      size: 30.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: AppColors.primaryColor,
                  tooltip: 'Inecrement',
                  shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewTaskPage()),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
