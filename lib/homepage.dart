import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  String result = '';
  void checkClass() {
    double gpa = double.tryParse(gpaController.text) ?? 0.0;
     String name = nameController.text;

    if (gpa >= 3.6 && gpa <= 4.0) {
      setState(() {
        result = '$name, you are in the First Class.';
      });
    } else if (gpa >= 3.0 && gpa <= 3.59) {
      setState(() {
        result = '$name, you are in the Second Class Upper';
      });
    } else if (gpa >= 2.0 && gpa <= 2.99) {
      setState(() {
        result = '$name, you are in the Second Class Lower';
      });
    } else if (gpa >= 1.5 && gpa <= 1.99) {
      setState(() {
        result = '$name, you are in the Third Class';
      });
    } else if (gpa >= 1.0 && gpa <= 1.49) {
      setState(() {
        result = '$name, you are in the Pass Class';
      });
    } else {
      setState(() {
        result = 'Invalid GPA';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
        title: const Text('GPA Class Checker'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: nameController,
                style: const TextStyle(color: Colors.black),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(226, 190, 190, 190),
                            width: 1.0,
                            style: BorderStyle.solid)),
                    hintText: 'Name',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(226, 190, 190, 190))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: gpaController,
                style: const TextStyle(color: Colors.black),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(226, 190, 190, 190),
                            width: 1.0,
                            style: BorderStyle.solid)),
                    hintText: 'GPA',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(226, 190, 190, 190))),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    height: 50,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.tealAccent)),
                        onPressed: () {
                          checkClass();
                        },
                        child: const Text(
                          "Check Class",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )),
                  ),
                ],
              ),
                const SizedBox(height: 20),
            Text(
              ' $result',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
