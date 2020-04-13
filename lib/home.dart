import 'package:cached_network_image/cached_network_image.dart';
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
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: flowerlist.length,
          itemBuilder: (BuildContext context, int index) {
            var photo = "http://services.hanselandpetal.com/photos/${flowerlist[index].photo}";
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Container(
                  margin: EdgeInsets.only(bottom: 10,top: 10,right: 5),
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl:photo,
                          width: 110,
                          height: 90,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "${flowerlist[index].name}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
