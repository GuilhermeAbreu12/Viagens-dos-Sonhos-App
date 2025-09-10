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
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          title: Text("DreamTrip Ltda."),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TelaCadastro(),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});
  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4, // 90% da página
          
          decoration: BoxDecoration(
            border: BoxBorder.all(
              color: Colors.black, 
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15)
            ),
            color: Colors.blue[300]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 34
                            ), 
                            Text(
                              "Suas viagens dos sonhos são possíveis aqui", 
                              style: TextStyle(color: Colors.white)
                            )
                          ]
                        )
                      )
                    ],
                  ),
                ]
              ),
              Column(
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.14,
                        child: Row (
                          children: [
                            ElevatedButton.icon(
                              onPressed: (){},
                              label: Text("Cadastrar novo"), 
                              icon: Icon(Icons.add),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white
                              ), 
                            ),
                            ElevatedButton.icon(
                              onPressed: (){}, 
                              label: Text("Ver cadastrados"),
                              icon: Icon(Icons.remove_red_eye_sharp),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black
                              ),
                            )
                          ]
                        )
                      ),
                    ]
                  )
                ]
              )
            ],
          )
        )
      ]
    );
  }
}
