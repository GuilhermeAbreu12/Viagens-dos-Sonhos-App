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

class TelaMenu extends StatelessWidget {
  const TelaMenu({super.key});
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
                              TelaCadastro();
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

class ConsultarCadastros extends StatefulWidget {
  const ConsultarCadastros({super.key});
  @override
  ConsultarCadastrosState createState() => ConsultarCadastrosState();
}

class ConsultarCadastrosState extends State<ConsultarCadastros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: viagens.length,
                    itemBuilder: (context, index) {
                      final viagem = viagens[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            viagem.UrlImagem,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            "${viagem.Destino} - ${viagem.PaisDestino}",
                          ),
                          subtitle: Text(viagem.Data),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  TextEditingController controllerDestino =
                                      TextEditingController(
                                        text: viagem.Destino,
                                      );
                                  TextEditingController controllerPaisDestino =
                                      TextEditingController(
                                        text: viagem.PaisDestino,
                                      );
                                  TextEditingController controllerData =
                                      TextEditingController(text: viagem.Data);
                                  TextEditingController controllerUrlImagem =
                                      TextEditingController(
                                        text: viagem.UrlImagem,
                                      );

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Editar destino"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: controllerDestino,
                                            decoration: InputDecoration(
                                              labelText: "Nome",
                                            ),
                                          ),
                                          TextField(
                                            controller: controllerPaisDestino,
                                            decoration: InputDecoration(
                                              labelText: "Local",
                                            ),
                                          ),
                                          TextField(
                                            controller: controllerData,
                                            decoration: InputDecoration(
                                              labelText: "Data",
                                            ),
                                          ),
                                          TextField(
                                            controller: controllerUrlImagem,
                                            decoration: InputDecoration(
                                              labelText: "Imagem",
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              viagens[index] = Viagem(
                                                Destino: controllerDestino.text,
                                                PaisDestino:
                                                    controllerPaisDestino.text,
                                                Data: controllerData.text,
                                                UrlImagem:
                                                    controllerUrlImagem.text,
                                              );
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Salvar"),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text("Cancelar"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                label: Text("Editar"),
                                icon: Icon(Icons.edit),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Deseja excluir a viagem para ${viagem.Destino}?",
                                        ),
                                        content: Text("Não é reversível!"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancelar"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                viagens.removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Tenho certeza!"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                label: Text("Deletar"),
                                icon: Icon(Icons.delete_forever),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // volta para a tela anterior
                },
                child: Text("Voltar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});
  @override
  TelaCadastroState createState() => TelaCadastroState();
}

List<Viagem> viagens = [];

class TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _controllerNomeDestino = TextEditingController();
  final TextEditingController _controllerNomePais = TextEditingController();
  final TextEditingController _controllerDataViagem = TextEditingController();
  final TextEditingController _controllerUrlImagem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 200, minWidth: 200),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Cadastro de viagens",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 600,
                          height: 80,
                          child: TextField(
                            controller: _controllerNomeDestino,
                            decoration: InputDecoration(
                              labelText: "Nome do destino",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 600,
                          height: 80,
                          child: TextField(
                            controller: _controllerNomePais,
                            decoration: InputDecoration(
                              labelText: "Nome do país de destino",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 600,
                          height: 80,
                          child: TextField(
                            controller: _controllerDataViagem,
                            decoration: InputDecoration(
                              labelText: "Data da viagem",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 600,
                          height: 80,
                          child: TextField(
                            controller: _controllerUrlImagem,
                            decoration: InputDecoration(
                              labelText: "URL da foto do destino",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(child: Text("Cuidado!")),
                                    content: Text(
                                      "Tem certeza que quer salvar esse destino? (Verifique se as informações estão corretas)",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: Text("Não tenho!"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Viagem novaViagem = Viagem(
                                            Destino:
                                                _controllerNomeDestino.text,
                                            PaisDestino:
                                                _controllerNomePais.text,
                                            Data: _controllerDataViagem.text,
                                            UrlImagem:
                                                _controllerUrlImagem.text,
                                          );

                                          Navigator.of(context).pop();

                                          setState(() {
                                            viagens.add(novaViagem);
                                          });

                                          _controllerNomeDestino.clear();
                                          _controllerNomePais.clear();
                                          _controllerDataViagem.clear();
                                          _controllerUrlImagem.clear();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => App(),
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                        ),
                                        child: Text("Tenho certeza!"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                            ),
                            child: Text("Salvar"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

