import 'package:flutter/material.dart';

class NearbyTesters extends StatelessWidget {
  const NearbyTesters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Store entry of nearby users retrived from database
    final List<Map<String, dynamic>> entries = testData;
    // Column is a vertical, linear layout.
    return Column(
      children: <Widget>[
        Text('Nearby testers in your area'),
        SizedBox(height: 10),
        ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: UserCard(
                userData: entries[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.userData}) : super(key: key);
  final Map<String, dynamic> userData;
  @override
  Widget build(BuildContext context) {
    // dynamic avatar = userData['avatar']; TODO Add avatar to nearby userList
    String name = userData['name'];
    String isInfected = userData['isInfected'];
    String locationTested = userData['locationTested'];
    String date = userData['date'];

    // Column is a vertical, linear layout.
    return ListTile(
      title: Text(name),
      isThreeLine: true,
      subtitle: Text(locationTested + " (" + isInfected + ") \n" + date),
      leading: CircleAvatar(), // TODO Replace with avatar of Google User
      trailing: IconButton(
        icon: const Icon(Icons.message_rounded),
        tooltip: 'Message User',
        onPressed: () {
          (() => {}); // TODO Redirecton to message page and user chatbox
        },
      ),
    );
  }
}

// Static Test Data
List<Map<String, dynamic>> testData = [
  {
    'name': 'Arjun',
    'isInfected': 'Positive',
    'locationTested': '117 High St.',
    'date': '01/07/2022',
  },
  {
    'name': 'Bill',
    'isInfected': 'Negative',
    'locationTested': '43 Mission St.',
    'date': '01/08/2022',
  },
  {
    'name': 'Jeffrey',
    'isInfected': 'Positive',
    'locationTested': '55 Laurel St.',
    'date': '01/09/2022',
  },
  {
    'name': 'Joey',
    'isInfected': 'Negative',
    'locationTested': '83 Chestnut St.',
    'date': '01/10/2022',
  }
];
