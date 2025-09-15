import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [TelaCadastro()],
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
    return ConstrainedBox(
      // Acabei de aprender isso aqui
      constraints: BoxConstraints(minHeight: 200, minWidth: 400),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.blue[300],
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Column(
                        children: [
                          SizedBox(height: 34, width: 100),
                          Text(
                            "Suas viagens dos sonhos são possíveis aqui",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: Text("Cadastrar novo"),
                            icon: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Cadastrar"),
                                    content: Text("Cadastre seu sei lá oq"),
                                    actions: [Cadastrar()],
                                  );
                                },
                              );
                            },
                            label: Text("Ver cadastrados"),
                            icon: Icon(Icons.remove_red_eye_sharp),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cadastrar extends StatelessWidget {
  const Cadastrar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("OI"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        ),
      ],
    );
  }
}
