import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waaasil/Screens/HomePageTopBarScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopScreenBar(),
          SingleChildScrollView(child: bottomScreenBar),
        ],
      ),
    );
  }
}

var bottomScreenBar = Column(
  verticalDirection: VerticalDirection.down,
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "الحالي",
            style: TextStyle(fontSize: 16.0, color: Colors.blueAccent),
          ),
          Spacer(),
          Text("عرض الكل (10)",
              style: TextStyle(fontSize: 16.0, color: Colors.black))
        ],
      ),
    ),
  ],
);

List<CityCard> cityCards = [
  CityCard(
    imagePath: "assets/images/athens.jpg",
    name: "الخرطوم",
    monthYear: "12-2019",
    discount: 20,
    oldPrice: 580,
    newPrice: 500,
  ),
  CityCard(
    imagePath: "assets/images/lasvegas.jpg",
    name: "دبي",
    monthYear: "12-2019",
    discount: 20,
    oldPrice: 580,
    newPrice: 500,
  ),
  CityCard(
    imagePath: "assets/images/sydney.jpeg",
    name: "أديس ابابا",
    monthYear: "12-2019",
    discount: 20,
    oldPrice: 580,
    newPrice: 500,
  ),
];

class CityCard extends StatelessWidget {
  const CityCard(
      {Key key,
      this.imagePath,
      this.name,
      this.monthYear,
      this.discount,
      this.oldPrice,
      this.newPrice})
      : super(key: key);

  final imagePath, name, monthYear, discount, oldPrice, newPrice;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 260.0,
                  width: 160.0,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.black12])),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            monthYear,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Text(
                          "$discount%",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                height: 210,
                child: ListView(
                    scrollDirection: Axis.horizontal, children: cityCards),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 50.0,
                    color: Colors.pinkAccent,
                  ),
                  Text(
                    formatCurrency.format(oldPrice),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    formatCurrency.format(newPrice),
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
