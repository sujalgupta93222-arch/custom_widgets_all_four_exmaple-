import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
      UserData user = UserData();  // Normal class object  // normal me object create karna padta ha ex: UserData user = UserData(); 

    // Let's change the data
    user.updateName("Sujal");
    user.increaseAge();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Widgets Types Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              // 1️⃣ FUNCTION WIDGET
              functionWidget("Function Widget"),
        
              const SizedBox(height: 20),
        
              // 2️⃣ NORMAL CLASS RETURNING WIDGET
              userWidget(user),
        
              const SizedBox(height: 20),
        
              // 3️⃣ STATELESS CUSTOM WIDGET
              const MyStatelessWidget(text: "Stateless Widget"),
        
              const SizedBox(height: 20),
        
              // 4 STATEFULL CUSTOM WIDGET
                  CustomCounter(title: 'statefull widgets example'),
        
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
// 1️⃣ FUNCTION WIDGET (Simple & Best for small UI)   isme ham log data ko store nahi kar sakte kyu ki data refresh me chala jayega 
//////////////////////////////////////////////////////

Widget functionWidget(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 20, color: Colors.red),
  );
}

//////////////////////////////////////////////////////
// 2️⃣ NORMAL CLASS — RETURNING WIDGET   a ek hepler class hai jo seb data ko manage uar logic deta ha isme agar koi UI  banani to to funtion widgets ke 
// use karna padta ha  iska use seb data store aur manage kaena hota ha 
//////////////////////////////////////////////////////

class UserData {  // data ko store kar raha ha 
  String name = "Kaloo";
  int age = 20;

  void updateName(String newName) {
    name = newName;
  }

  void increaseAge() {
    age++;
  }
}

Widget userWidget(UserData data) {  // funtion widget ko use kar raha ha UI dene ke liya ?
  return Column(
    children: [
      Text("Name: ${data.name}"),
      Text("Age: ${data.age}"),
    ],
  );
}

//////////////////////////////////////////////////////
// 3️⃣ PROPER CUSTOM WIDGET — STATELESS WIDGET CLASS  its use for ui banane ke liya but data ko manage nahi kar sakta
//////////////////////////////////////////////////////

class MyStatelessWidget extends StatelessWidget {
  final String text;

  const MyStatelessWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, color: Colors.green),
    );
  }
}

////4 statefull widget example for UI + data manage ////

class CustomCounter extends StatefulWidget {
  final String title;

  const CustomCounter({super.key, required this.title});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 22)),
            Text("$count",
                style: const TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}




