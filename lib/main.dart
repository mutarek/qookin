import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> goto = [
    'Dhaka',
    'Chittagong',
    'Sylhet',
    'Rajshahi',
    'Jessore'
  ];
  String selectedpalce = 'Dhaka';
  String destineationPlace = 'Sylhet';
  String selectedDate = getCurrentDate(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select Your Deperture :',
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.all(10),
              child: FormField(builder: (FormFieldState<String> state) {
                return InputDecorator(
                    decoration: InputDecoration(errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0), hintText: 'Please select expense', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
                    child: DropdownButton<String>(
                      onChanged: (value) {
                        setState(() {
                          selectedpalce = value;
                        });
                      },
                      value: selectedpalce,
                      hint: const Center(
                        child: Text(
                          'Deperture',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                        size: 50,
                      ),
                      isExpanded: true,
                      items: goto
                          .map((e) => DropdownMenuItem(
                                child: Card(
                                  elevation: 10,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      e,
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                                value: e,
                              ))
                          .toList(),
                      selectedItemBuilder: (BuildContext context) {
                        return goto.map((e) {
                          return Center(
                            child: Text(
                              e,
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        }).toList();
                      },
                    ));
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select Your Destination :',
              style: TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 350,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(22.0), color: Colors.amber),
              child: DropdownButton<String>(
                onChanged: (value) {
                  setState(() {
                    destineationPlace = value;
                  });
                },
                value: destineationPlace,
                hint: const Center(
                  child: Text(
                    'Deperture',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 30,
                ),
                isExpanded: true,
                items: goto
                    .map((e) => DropdownMenuItem(
                          child: Card(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                          value: e,
                        ))
                    .toList(),
                selectedItemBuilder: (BuildContext context) {
                  return goto.map((e) {
                    return Center(
                      child: Text(e),
                    );
                  }).toList();
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            width: 100,
            child: Center(
              child: InkWell(
                  onTap: () {
                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2024)).then((DateTime value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = getCurrentDate(value);
                        });
                      }
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.red,
                  )),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text('Date: ' + selectedDate.toString()),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
                onPressed: () {
                  if (selectedpalce == destineationPlace) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Opps! ',
                              style: TextStyle(color: Colors.red, fontSize: 25),
                            ),
                            content: Text('Destination & Deperture Cant Be Same'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Okey'))
                            ],
                          );
                        });
                  }
                },
                child: Text('Search Flights')),
          )
        ],
      ),
    );
  }
}

String getCurrentDate(DateTime datetime) {
  DateFormat formateer = DateFormat('yyyy-MM-dd');
  return formateer.format(datetime);
}
