import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Text("DreamTrip Ltda."),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueAccent, 
                      width: 0.5
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 0),
                      ),
                    ]
                  ),
                  child: Text(
                    "As viagens dos sonhos agora são reais", 
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ]
            ),
            TelaCadastro(),
          ],
        ),
      ),
    );
  }
}

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.05,
          width: MediaQuery.of(context).size.width * 0.9, // 90% da página
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: BoxBorder.all(
              color: Colors.black, 
              width: 1,
            ),
            borderRadius: BorderRadius.all(
  
              Radius.circular(15)
            ),
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blueAccent,
                width: MediaQuery.of(context).size.width * 0.44,
              ),
              Container(
                color: Colors.green[600],
                width: MediaQuery.of(context).size.width * 0.44,
              ),
            ],
          )
        )
      ]
    );
  }
}
