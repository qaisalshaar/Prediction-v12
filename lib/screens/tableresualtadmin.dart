import 'package:dagnosis_and_prediction/screens/current_location.dart';
import 'package:dagnosis_and_prediction/screens/users_screen.dart';
import 'package:flutter/material.dart';

// Imports all Widgets included in [multiselect] package
// import 'package:horizontal_data_table/horizontal_data_table.dart';

final TextEditingController medicenController = TextEditingController();

class TableResualtadmin extends StatefulWidget {
  const TableResualtadmin({Key? key}) : super(key: key);

  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<TableResualtadmin> {
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Diabetes Reading By Days'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Center(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Patient Name : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'ahmed saeed',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Gender : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Start Insert List View Horisontal List
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TableContent(),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: 1,
              ),
            ),

            const SizedBox(
              height: 30,
              width: 300,
            ),

            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyCurrentLocation(
                        email: 'a@a.com',
                      ),
                    ),
                  );
                },
                icon: const Icon(
                    Icons.add_location_rounded), //icon data for elevated button
                label: const Text("Find Patient Location"), //label text
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(
                        255, 68, 255, 93) //elevated btton background color
                    )),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(left: 30),
                child: Column(children: const [
                  Text(
                    'Doctor Advise : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ])),

            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   // DropDownMultiSelect comes from multiselect
            //   child: Container(
            //     width: 200,
            //     // margin: EdgeInsets.symmetric(horizontal: 70),
            //     child: DropDownMultiSelect(
            //       onChanged: (List<String> x) {
            //         setState(() {
            //           selected = x;
            //         });
            //       },
            //       options: ['Diet Food', 'Medicine'],
            //       selectedValues: selected,
            //       whenEmpty: ('Select Something'),
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 5,
            ),

            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  // hintText: 'Note',
                  labelText: "Doctor Note",

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.edit),
                ),
                controller: medicenController,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  medicenController.text = value!;
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                // log(ParentChildCheckbox.isParentSelected.toString());
                // log(ParentChildCheckbox.selectedChildrens.toString());
              },
            ),
            const SizedBox(
              height: 20,
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsresScreen(),
                  ),
                );
              },
              icon: const Icon(
                  Icons.assignment_return), //icon data for elevated button
              label: const Text("Go Back"), //label text
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(
                  255,
                  255,
                  68,
                  68,
                ), //elevated btton background color
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget TableContent() => // start messenger horisental list

    Center(
        child: Column(children: <Widget>[
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Table(
              defaultColumnWidth: const FixedColumnWidth(110.0),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: [
                  Column(children: const [
                    Text('Days',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                  Column(children: const [
                    Text('Glucose Rate',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                  Column(children: const [
                    Text('Cholesterol',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                  Column(children: const [
                    Text('Diet Food',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
                  Column(children: const [
                    Text('Medicine',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                  Column(children: const [
                    Text('Action',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('10/10/2021')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('200')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('125')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Diet Food')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Medicen')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(children: const [
                      Text('Emergency Situation',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red))
                    ]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('10/10/2021')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('200')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('125')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Diet Food')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Medicen')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(children: const [
                      Text('Emergency Situation',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red))
                    ]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('10/10/2021')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('100')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('125')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Diet Food')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Medicen')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(children: const [
                      Text('Normal',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent))
                    ]),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('10/10/2021')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('133')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('122')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Diet Food 1')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(children: const [Text('Medicen 1')]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(children: const [
                      Text('Normal',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent))
                    ]),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    ]));
