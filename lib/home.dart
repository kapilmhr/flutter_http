import 'package:flowers/ApiServices.dart';
import 'package:flowers/models/flowers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flowers"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: FutureBuilder<List<Flower>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.length);
              print("api");
              return FlowerList(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.indigo),
                ),
              ),
            );
          },
          future: ApiServices().getFlowers(),
        ),
      ),
    );
  }
}

class FlowerList extends StatelessWidget {
  final List<Flower> flowerlist;

  const FlowerList(this.flowerlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          scrollDirection: Axis.vertical,
          itemCount: flowerlist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Container(child: Text("${flowerlist[index].name}")),
            );
          }),
    );
  }
}
