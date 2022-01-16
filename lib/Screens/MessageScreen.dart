import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:covinet/Authenticate/Methods.dart';
import 'package:covinet/Screens/ChatRoom.dart';
import 'package:covinet/group_chats/group_chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with WidgetsBindingObserver {
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int count = 0;
  final List<List<String>> data = [
    ["Positive", "123 Street"],
    ["Positive", "123 Street"],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Negative", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Negative", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Negative", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Negative", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Positive", "43 Mission St."],
    ["Negative", "43 Mission St."],
    ["Positive", "83 Chestnut St."],
    ["Positive", "83 Chestnut St."],
    ["Negative", "83 Chestnut St."],
    ["Positive", "123 Street"],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "123 Street"],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "83 Chestnut St."],
    ["Positive", "83 Chestnut St."],
    ["Negative", "83 Chestnut St."],
    ["Negative", "83 Chestnut St."],
    ["Negative", "83 Chestnut St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Positive", "117 High St."],
    ["Negative", "117 High St."],
    ["Positive", "117 High St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "117 High St."],
    ["Negative", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
    ["Negative", "55 Laurel St."],
    ["Positive", "55 Laurel St."],
  ];

  @override
  void initState() {
    super.initState();
    getUsers();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() {
    count = 0;
    for (var element in data) {
      if (element[0] == "Positive" && element[1] == _search.text) {
        setState(() {
          count++;
        });
      }
    }
    print(count);
  }

  void getUsers() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore.collection('users').get().then((value) {
      setState(() {
        userMap = value.docs;
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 50,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Search Place",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .3),
                  child: AnimatedButton(
                    text: "Search",
                    pressEvent: () {
                      onSearch();
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.INFO_REVERSED,
                          borderSide: BorderSide(color: Colors.green, width: 2),
                          width: 280,
                          buttonsBorderRadius:
                              BorderRadius.all(Radius.circular(2)),
                          headerAnimationLoop: false,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'INFO',
                          desc: "This area has $count covid-19 cases")
                        ..show();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                userMap != null
                    ? Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: userMap!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  String roomId = chatRoomId(
                                      _auth.currentUser!.displayName!,
                                      userMap![index].data()['name']);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatRoom(
                                        chatRoomId: roomId,
                                        userMap: userMap![index].data(),
                                      ),
                                    ),
                                  );
                                },
                                leading: Icon(Icons.account_box,
                                    color: Colors.black),
                                title: Text(
                                  userMap![index].data()['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(userMap![index].data()['covid']),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "Last updated: ${userMap![index].data()['date']}"),
                                  ],
                                ),
                                trailing: Icon(Icons.chat, color: Colors.black),
                              );
                            },
                          ),
                        ),
                      )
                    : Container(),
              ],

              // floatingActionButton: FloatingActionButton(
              //   child: Icon(Icons.group),
              //   onPressed: () => Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (_) => GroupChatMessageScreen(),
              //     ),
              //   ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.group),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GroupChatMessageScreen(),
          ),
        ),
      ),
    );
  }
}
