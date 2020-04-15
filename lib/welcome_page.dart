import 'package:flutter/material.dart';
import 'data_get.dart';
import 'info_page.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF101328),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('COVID-TRACK',
              style: TextStyle(
                color: Color(0xffa2a6a8),
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
              ),
            ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (value){
                  country = value;
                },
                style: TextStyle(color: Colors.white,
                fontSize: 18),
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF1D1F33),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  labelText: 'Enter a Country :',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )
                ),
              ),
              SizedBox(height: 10,),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Get data',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                color: Color(0xff99e663),
                onPressed: ()async{
                  NetHelper net =  NetHelper(country: country);
                  var newData = await net.getData();
                  if(newData!=404){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoPage(covidData:newData)));
                  }else{
                    showDialog(context: context,
                      builder: (BuildContext context){
                      return Opacity(
                        opacity: 0.90,
                        child: AlertDialog(
                          backgroundColor: Color(0xFF1D1F33),
                          title: Center(child: Text('!!ERROR!!',style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w900
                          ),)),
                          content: Text('Invalid country name,Please check',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                      );
                      });
                  }
                },
              )
            ],),
        ),
      ),

    );
  }
}
