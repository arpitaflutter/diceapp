import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  List l1 = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png",
  ];

  List Dicelist = [];
  List rndlist = [];

  int i=0;
  int n=0;

  TextEditingController txtdiceapp = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dice app"),
          centerTitle: true,
          backgroundColor: Colors.red.shade900,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtdiceapp,
                decoration: InputDecoration(
                  hintText: "Enter the number you want",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {

                var data = txtdiceapp.text;
                int n = int.parse(data);

                Dicelist.clear();
                rndlist.clear();
                setState(() {
                  for(i=0;i<n;i++)
                    {
                      Dicelist.add(0);
                    }
                });
              },
              child: Container(
                height: 50,width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("Generate",style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Dicelist.asMap()
                    .entries
                    .map((e) => Padding(padding: EdgeInsets.all(8),
                                child: Image.asset(l1[rndlist.isEmpty? 0: rndlist[e.key]],
                                height: 100,width: 100,),
                              ),
                            )
                            .toList(),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                var data = txtdiceapp.text;
                int n = int.parse(data);

                var rnd = Random();
                rndlist.clear();
                setState(() {
                  for(i=0;i<n;i++)
                    {
                      int index = rnd.nextInt(6);
                      rndlist.add(index);
                    }
                });
              },
              child: Container(
                height: 50,width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("Play",style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
