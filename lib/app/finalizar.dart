import 'package:bytebuilder/domain/case/salvar_compra.dart';
import 'package:bytebuilder/domain/data/compra_dto.dart';
import 'package:bytebuilder/infra/database/repository/compra_repository_impl.dart';
import 'package:bytebuilder/infra/database/repository/placa_mae_repository_impl.dart';
import 'package:bytebuilder/infra/database/repository/processador_repository_impl.dart';
import 'package:flutter/material.dart';

class Finalizar extends StatelessWidget {
  Finalizar({required this.compra});
  CompraDTO compra;

  @override
  Widget build(BuildContext context) {
    var compraRepo = CompraRepositoryImpl();

    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(compra.placaMae.nome),
              leading: Icon(Icons.production_quantity_limits),
              subtitle: Text(compra.placaMae.marca),
              trailing: Text(compra.placaMae.preco.toString()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(compra.processador.nome),
              leading: Icon(Icons.production_quantity_limits),
              subtitle: Text(compra.processador.marca),
              trailing: Text(compra.processador.preco.toString()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            SalvarCompra(compra, PlacaMaeRepositoryImpl(), ProcessadorRepositoryImpl(), CompraRepositoryImpl());
          } catch (err) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Erro"),
                content: Text(err.toString()),
              ),
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
