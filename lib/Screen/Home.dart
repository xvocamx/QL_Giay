import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
      ),
      body: Container(
        child: GridView(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add,size: 40,color: Colors.black,),
                  Text("Thêm giày",style: TextStyle(fontSize: 20,color: Colors.black),)
                ],
              ),
            ),
            Container(color: Colors.green,),
            Container(color: Colors.green,),
          ],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 20,crossAxisSpacing: 20),
        )
      ),
    );
  }
}
