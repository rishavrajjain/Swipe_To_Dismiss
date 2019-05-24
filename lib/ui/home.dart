import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i=0;
  List <String> items = new List<String>.generate(30,(i)=>"Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: AppBar(title: new Text("Swipe to Delete"),backgroundColor: Colors.amberAccent,),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context , int index){
          return new Dismissible(
            key: new Key(items[index]),
            onDismissed: (direction){
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                new SnackBar(
                content: new Text("Item dismissed"),
              ));
            },
            background: new Container(
              color: Colors.red,
            ),
            child: new ListTile(
              title: new Text("${items[index]}"),
            ),

          );
        },
      ),

    );
  }
}