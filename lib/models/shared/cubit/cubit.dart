import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/screens/tasks_screens/alltasks.dart';
import 'package:to_do/screens/tasks_screens/finished.dart';
import 'package:to_do/screens/tasks_screens/inprocess.dart';
import 'package:to_do/models/shared/cubit/states.dart';
import 'package:to_do/screens/tasks_screens/waiting.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntiatState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const AllTasksScreen(),
    const InprocessScreen(),
    const WaitingScreen(),
    const FinishedScreen(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBotNaBar());
  }

  List<Map> tasks = [];
  //database.

  Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'tasky.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {}

  _onCreate(Database db, int version) async {
    await db
        .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, priority TEXT, date TEXT,status TEXT)')
        .then((val) {
      emit(AppCrateDb());
    }).catchError((error) {});
  }

//select
  void readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    emit(AppGetDb());
    tasks = response;
  }

//delete
  deleteData(int id) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete('DELETE FROM tasks WHERE id=?', [id]);
    emit(AppDeleteDb());
    return response;
  }

//update
  Future<int> updateData(String status, id) async {
    Database? mydb = await db;
    int response = await mydb!
        .rawUpdate('UPDATE tasks SET status=? WHERE  id=?', [status, id]);
    emit(AppUpdateDb());
    emit(AppGetDb());
    return response;
  }

//insert
  insertData(
      String title, String description, String priority, String date) async {
    Database? mydb = await db;
    var response = await mydb!.rawInsert(
        'INSERT INTO tasks (title, description, priority,date,status) VALUES("$title", "$description","$priority","$date","Waiting")');
    emit(AppInsertDb());
    return response;
  }
}
