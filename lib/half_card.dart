import 'package:flutter/material.dart';

class HalfCard extends StatelessWidget {
  HalfCard({this.title,this.newdata,this.h2color});
  final String title;
  final  String newdata;
  final Color h2color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF1D1F33),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Text(title,style: TextStyle(
              color: h2color,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 10,),
            Text(newdata,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 46,
                  color: Colors.white
              ),
            )
          ],),
        ),
      ),
    );
  }
}

