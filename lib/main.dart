import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_crud/dataclass.dart';
import 'package:user_crud/detdata.dart';
import 'dbservices.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "User CRUD",
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _searchText = TextEditingController();

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _searchText.addListener(onSearch);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    return Database.getData(_searchText.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetData(),
            ),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Column(
          children: [
            TextField(
              controller: _searchText,
              decoration: InputDecoration(
                hintText: "Search Email",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: onSearch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("ERROR");
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        DocumentSnapshot dsData = snapshot.data!.docs[index];
                        String lvemail = dsData['email'];
                        String lvname = dsData['name'];
                        String lvphoto = dsData['photo'];
                        String lvaddress = dsData['address'];
                        String lvdescription = dsData['description'];
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            padding: EdgeInsets.only(left: 8),
                            alignment: Alignment.centerLeft,
                            color: Colors.red,
                            child: Icon(Icons.delete),
                          ),
                          secondaryBackground: Container(
                            padding: EdgeInsets.only(right: 8),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: Icon(Icons.delete),
                          ),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              return true;
                            } else {
                              return true;
                            }
                          },
                          onDismissed: (direction) {
                            Database.hapusData(emailhapus: lvemail);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Data ${lvemail} deleted',
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            onTap: () {
                              final dtbaru = DataUser(
                                dataEmail: lvemail,
                                dataName: lvname,
                                dataPhoto: lvphoto,
                                dataAddress: lvaddress,
                                dataDescription: lvdescription,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetData(
                                    dataDet: dtbaru,
                                  ),
                                ),
                              );
                            },
                            onLongPress: () {
                              Database.hapusData(emailhapus: lvemail);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Data ${lvemail} deleted',
                                  ),
                                ),
                              );
                            },
                            title: Text(lvemail),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                lvphoto,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name : " + lvname),
                                Text("Address : " + lvaddress),
                                Text("Description : " + lvdescription),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8,
                      ),
                      itemCount: snapshot.data!.docs.length,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.pinkAccent,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
