import 'package:bytebuilder/app/home.dart';
import 'package:bytebuilder/domain/data/email_dto.dart';
import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/data/produto_dto.dart';
import 'package:bytebuilder/domain/entity/placa_mae.dart';
import 'package:bytebuilder/infra/database/repository/placa_mae_repository_impl.dart';
import 'package:bytebuilder/infra/email_manager/email_manager_impl.dart';
import 'package:flutter/material.dart';

void main() async {
  // await teste();
  runApp(MyApp());
}

Future<void> teste() async {
  var repo = PlacaMaeRepositoryImpl();
  for (int i = 0; i < 5; i++) {
    var placa = PlacaMaeDTO(nome: "Placa $i", ddr: i + 2, marca: "Marca $i", preco: i + i * 1000, socket: "LGA 115$i");
    repo.salvar(placa);
  }
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
      home: Home(),
    );
  }
}
