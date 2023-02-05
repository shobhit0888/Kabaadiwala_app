import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_page.dart';

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  bool valueMetal = false;
  bool valuePaper = false;
  bool valueElectronic = false;
  bool valueWooden = false;
  bool valueConstruction = false;
  bool t1 = false;
  bool t2 = false;
  bool t3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell the Waste"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              "What do you have?".text.xl3.bold.make(),
              CheckboxListTile(
                secondary: const Icon(Icons.add_box),
                title: const Text('Paper'),
                subtitle: Text('Books, Cartons, etc'),
                value: valuePaper,
                onChanged: (bool? value) {
                  setState(() {
                    valuePaper = value!;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.add_box),
                title: const Text('Metal'),
                subtitle: Text('Accidental car, plumbing material, etc'),
                value: valueMetal,
                onChanged: (bool? value) {
                  setState(() {
                    valueMetal = value!;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.add_box),
                title: const Text('Wood'),
                subtitle: Text('Furniture, Plywood, etc'),
                value: valueWooden,
                onChanged: (bool? value) {
                  setState(() {
                    valueWooden = value!;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.add_box),
                title: const Text('Electronic'),
                subtitle: Text('Batteries, boards, etc'),
                value: valueElectronic,
                onChanged: (bool? value) {
                  setState(() {
                    valueElectronic = value!;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.add_box),
                title: const Text('Construction'),
                subtitle: Text('Bricks, Concrete Blocks, etc'),
                value: valueConstruction,
                onChanged: (bool? value) {
                  setState(() {
                    valueConstruction = value!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              "Preferred Pick Up Time Slot".text.xl3.bold.make(),
              CheckboxListTile(
                secondary: const Icon(Icons.lock_clock),
                title: const Text('9a.m. - 12p.m.'),
                // subtitle: Text('Furniture, Plywood, etc'),
                value: t1,
                onChanged: (bool? value) {
                  setState(() {
                    t1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.lock_clock),
                title: const Text('12p.m. - 3p.m.'),
                // subtitle: Text('Batteries, boards, etc'),
                value: t2,
                onChanged: (bool? value) {
                  setState(() {
                    t2 = value!;
                  });
                },
              ),
              CheckboxListTile(
                secondary: const Icon(Icons.lock_clock),
                title: const Text('3p.m. - 6p.m.'),
                // subtitle: Text('Batteries, boards, etc'),
                value: t3,
                onChanged: (bool? value) {
                  setState(() {
                    t3 = value!;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                //image capture button
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),

                icon: Icon(Icons.check_box_sharp),
                label: "Submit".text.xl2.make(),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
