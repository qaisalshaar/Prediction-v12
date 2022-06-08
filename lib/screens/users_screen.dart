import 'package:dagnosis_and_prediction/db/db_helper.dart';
import 'package:dagnosis_and_prediction/model/collection.dart';
import 'package:dagnosis_and_prediction/screens/home_screen.dart';
import 'package:dagnosis_and_prediction/screens/tableresualt.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UsresScreen extends StatefulWidget {
  Collection? collection;
  UsresScreen({Key? key, this.collection}) : super(key: key);

  @override
  State<UsresScreen> createState() => _UsresScreenState();
}

class _UsresScreenState extends State<UsresScreen> {
  late List<Collection> users;
  @override
  void initState() {
    super.initState();
    getusers();
  }

  getusers() async {
    users = await DBHelper.getcoll();
    // print('tttttttttttt ${users.first.firstName}');
    return users;
  }

  // sampleFunction() {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              const SizedBox(height: 55),
              Column(
                children: [
                  SizedBox(
                      height: 100,
                      child: Image.asset(
                        "assets/test.png",
                        fit: BoxFit.contain,
                      )),
                ],
              ),
              const SizedBox(height: 55),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Administrator Page :',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                width: 350.00,
                child: const TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white60,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red, width: 3),
                    ),
                  ),
                ),
              ),

              // seacrhField,
              const SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: FutureBuilder(
                    future: getusers(),
                    builder: (ctx, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: users.length,
                          itemBuilder: ((context, i) {
                            // don't show admin screen
                            return users[i].email == "omar@gmail.com"
                                ? Container()
                                : Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Material(
                                          elevation: 5,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: users[i].glucoserate! >= 200
                                              ? Colors.redAccent
                                              : Colors.green,
                                          child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TableResualt(
                                                    collection: users[i],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              '${users[i].firstName}',
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          }),
                        );
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ]),
      )),
    ));
  }
}
