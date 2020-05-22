import 'package:flutter/material.dart';

class PlantsPage extends StatefulWidget {
  @override
  _PlantsPageState createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 30.0,
        backgroundColor: Color(0xff55e890),
        title: Text("Minhas Plantas", style: TextStyle(fontSize: 23.0),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), iconSize: 30.0, color: Colors.white,onPressed: () {},),
          IconButton(icon: Icon(Icons.add), iconSize: 30.0, color: Colors.white,onPressed: () {}),
        ],
      ),
      backgroundColor: Color(0xffF1F5F9),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Divider(),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xff55e890),
                  ),
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    //padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Divider(color: Colors.transparent),
                          Text('Maria Babuço', style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                              color: Color(0xff4f4f4f)
                          ),),
                          Text('Babuço - Attalea speciosa', style: TextStyle(
                            fontSize: 13.0,
                            color: Color(0xff55e890)
                          ),),
                          Divider(color: Colors.transparent, height: 10.0,),
                          Text('Status: Saudável', style: TextStyle(
                           fontWeight: FontWeight.w300
                          ),),
                          Divider(color: Colors.transparent,),
                        ],
                      ),
                      leading: Image.asset(
                          "images/vaso.png",
                      ),
                      backgroundColor: Colors.transparent,
                      children: <Widget>[
                        Text('Teste Expandido')
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
                /*Container(
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffD8CE4D),
                  ),
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    //padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Divider(color: Colors.transparent),
                          Text('Joana Babuço', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4f4f4f)
                          ),),
                          Text('Babuço - Attalea speciosa', style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xff55e890)
                          ),),
                          Divider(color: Colors.transparent, height: 10.0,),
                          Text('Status: Saudável', style: TextStyle(
                              fontWeight: FontWeight.w300
                          ),),
                          Divider(color: Colors.transparent,),
                        ],
                      ),
                      leading: Image.asset(
                        "images/vaso.png",
                      ),
                      backgroundColor: Colors.transparent,
                      children: <Widget>[
                        Text('Teste Expandido')
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),*/
                Container(
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffEC5B36),
                  ),
                  padding: EdgeInsets.only(top: 5),
                  child: Container(
                    //padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Divider(color: Colors.transparent),
                          Text('Jambu do Mato', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4f4f4f)
                          ),),
                          Text('Jambu', style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xff55e890)
                          ),),
                          Divider(color: Colors.transparent, height: 10.0,),
                          Text('Status: Alerta', style: TextStyle(
                              fontWeight: FontWeight.w300
                          ),),
                          Divider(color: Colors.transparent,),
                        ],
                      ),
                      leading: Image.asset(
                        "images/vaso.png",
                      ),
                      backgroundColor: Colors.transparent,
                      children: <Widget>[
                        Text('Teste Expandido')
                      ],
                    ),
                    color: Colors.white,
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
