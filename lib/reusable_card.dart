import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.header, this.data,this.hcolor});

  final String data;
  final String  header;
  final Color hcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(header,
                style: TextStyle(
                  color: hcolor,
                  fontSize: 21,
                  fontWeight: FontWeight.w700
                ),),
              ),
              Center(
                child: Text(data,
                style: TextStyle(
                  fontSize: 67.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                ),),
              ),
            ],
          ),
        ),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color(0xFF1D1F33),
            borderRadius: BorderRadius.circular(10.0)),
      );
  }
}