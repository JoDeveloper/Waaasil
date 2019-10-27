import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:waaasil/Theme/Theme.dart';
import 'package:waaasil/cities/cities.dart';

class TopScreenBar extends StatefulWidget {
  @override
  _TopScreenBarState createState() => _TopScreenBarState();
}

class _TopScreenBarState extends State<TopScreenBar> {
  bool isFlightSelected = true;
  int selectedCity = 0;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            height: height / 2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.deepOrangeAccent])),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    PopupMenuButton(
                      onSelected: (index) {
                        setState(() {
                          print("jksjkfjaskfja");
                          selectedCity = index;
                          print(index);
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            cities[selectedCity],
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
                        PopupMenuItem(
                          child: Text(
                            cities[0],
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        PopupMenuItem(
                          child: Text(
                            cities[1],
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        PopupMenuItem(
                          child: Text(
                            cities[2],
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    )
                  ],
                )),
            SizedBox(
              height: height / 25,
            ),
            Text(
              "إلي أين تريد الذهاب ؟",
              style: TextStyle(
                  fontSize: 18.0, color: Colors.white70.withOpacity(1)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                child: TextField(
                  controller: TextEditingController(text: cities[selectedCity]),
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                  ),
                  cursorColor: appTheme.primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      prefixIcon: Material(
                        elevation: 0.0,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = true;
                      });
                    },
                    child: ChoiceChip(
                      Icons.flight_takeoff,
                      "رحلة",
                      isFlightSelected,
                    ),
                  ),
                  SizedBox(
                    width: height / 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },
                    child: ChoiceChip(
                      Icons.card_travel,
                      "أمتعة",
                      !isFlightSelected,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  const ChoiceChip(
    this.icon,
    this.text,
    this.isSelected,
  );

  final IconData icon;
  final bool isSelected;
  final String text;

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withAlpha(70),
              borderRadius: BorderRadius.all(Radius.circular(45.0)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(width: 6.0),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
