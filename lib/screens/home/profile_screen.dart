import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                subtitle: Text(
                  'Aiman S.Qaddoori',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text(
                  'Phone',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                subtitle: Text(
                  '+9647717190002',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.copy),
              ),
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text(
                  'Level',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                subtitle: Text(
                  'Senior',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                subtitle: Text(
                  'Baghdad Iraq',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
