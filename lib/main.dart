import 'package:bytebuilder/domain/data/email_dto.dart';
import 'package:bytebuilder/domain/data/produto_dto.dart';
import 'package:bytebuilder/infra/database/connection.dart';
import 'package:bytebuilder/infra/email_manager/email_manager_impl.dart';
import 'package:flutter/material.dart';

void main() {
  teste();
}

void teste() async {
  var email = EmailManagerImpl();

  var dto = EmailDTO(
    assunto: "Compra concluída.",
    destino: "cristian_ceccon45@hotmail.com",
    msg: "Sua compra foi concluída com sucesso.",
    precoTotal: 12000,
    produtos: [ProdutoDTO(nome: "Processador I18", preco: 6000), ProdutoDTO(nome: "Placa Mãe AORUS RGB PRO", preco: 6000)],
  );

  email.enviarEmail(dto);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => Connection.deleteDB(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: teste,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
