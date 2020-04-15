import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'half_card.dart';

class InfoPage extends StatefulWidget {
  InfoPage({this.covidData});
  final dynamic covidData;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int totalcases;
  int active;
  int recoverdcases;
  int totdeaths;
  int ncases;
  int ndeaths;
  int testpm;
  int deathpm;
  String cont;
  String flagurl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI(widget.covidData);
  }
  void UpdateUI(dynamic covidData){
    flagurl = covidData['countryInfo']['flag'];
    cont = covidData['country'];
    totalcases = covidData['cases'];
    recoverdcases = covidData['recovered'];
    totdeaths = covidData['deaths'];
    ncases = covidData['todayCases'];
    ndeaths = covidData['todayDeaths'];
    testpm = covidData['testsPerOneMillion'];
    deathpm = covidData['deathsPerOneMillion'];
    active=covidData['active'];





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1F33),
      body: SafeArea(child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color(0xFF101328),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Country:',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                    ),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(cont,style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.5,
                              color: Colors.white),
                          softWrap: true,),
                          Image(
                            image: NetworkImage(
                                flagurl),
                          height: 25,),
                        ],
                      ),
                    ),
                    ReusableCard(header: 'Coronavirus Cases :',hcolor: Colors.white ,data: totalcases.toString(),),
                    ReusableCard(header: 'Active Cases :',hcolor: Colors.white,data: active.toString(),),
                    ReusableCard(header: 'Recovered :',hcolor: Colors.lightGreen,data: recoverdcases.toString(),),
                    ReusableCard(header: 'Deaths :',hcolor: Colors.redAccent,data: totdeaths.toString(),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        HalfCard(title: 'New Cases :',newdata: ncases.toString(),h2color: Colors.white,),
                        HalfCard(title: 'New Deaths :',newdata: ndeaths.toString(),h2color: Colors.redAccent,)
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        HalfCard(title: 'Test/Million:',newdata: testpm.toString(),h2color: Colors.lightGreen,),
                        HalfCard(title: 'Death/Million:',newdata: deathpm.toString(),h2color: Colors.redAccent,)
                      ],)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

