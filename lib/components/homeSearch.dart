import 'package:flutter/material.dart';

class HomeSearch extends StatefulWidget {
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  String locationValue;
  String typeValue;
  String priceValue;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.width,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(150)),
          color: const Color(0xff6C54FF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50.0, 60.0, 0, 0),
              child: Text(
                "I'm looking for : ",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: DropdownButton<String>(
                          value: locationValue,
                          icon: Icon(Icons.arrow_downward, color: Colors.white),
                          iconSize: 15,
                          elevation: 16,
                          hint: Text('Location'),
                          style: TextStyle(color: Colors.black54),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String newValue) {
                            if (newValue != 'Any') {
                              setState(() {
                                locationValue = newValue;
                              });
                            } else {
                              setState(() {
                                locationValue = null;
                              });
                            }
                          },
                          items: <String>[
                            'Any',
                            'Antalia',
                            'Bursa',
                            'Fethiye',
                            'Istanbul',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: typeValue,
                          icon: Icon(Icons.arrow_downward, color: Colors.white),
                          iconSize: 15,
                          elevation: 16,
                          style: TextStyle(color: Colors.black54),
                          hint: Text('Type'),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String newValue) {
                            if (newValue != 'Any') {
                              setState(() {
                                typeValue = newValue;
                              });
                            } else {
                              setState(() {
                                typeValue = null;
                              });
                            }
                          },
                          items: <String>[
                            'Any',
                            'Apartment',
                            'Penthouse',
                            'Villa',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          value: priceValue,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          iconSize: 15,
                          elevation: 16,
                          hint: Text('Max Price'),
                          style: TextStyle(color: Colors.black54),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String newValue) {
                            if (newValue != 'Any') {
                              setState(() {
                                priceValue = newValue;
                              });
                            } else {
                              setState(() {
                                priceValue = null;
                              });
                            }
                          },
                          items: <String>[
                            'Any',
                            '50000',
                            '100000',
                            '150000',
                            '200000',
                            '300000',
                            '400000',
                            '500000',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  color: const Color(0xff2A3143),
                  onPressed: () {
                    List searchValues = [];
                    locationValue != null
                        ? searchValues.add(['location', locationValue])
                        : null;
                    typeValue != null
                        ? searchValues.add(['type', typeValue])
                        : null;
                    priceValue != null
                        ? searchValues.add(['price', priceValue])
                        : null;

                    Navigator.of(context).pushNamed(
                      '/properties',
                      arguments: searchValues,
                    );
                  },
                  child: Text(
                    'SEARCH',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
