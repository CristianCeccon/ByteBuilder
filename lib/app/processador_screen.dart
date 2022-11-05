import 'package:bytebuilder/app/finalizar.dart';
import 'package:bytebuilder/domain/data/compra_dto.dart';
import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/data/processador_dto.dart';
import 'package:bytebuilder/infra/database/repository/processador_repository_impl.dart';
import 'package:flutter/material.dart';

class ProcessadorScreen extends StatelessWidget {
  ProcessadorScreen({required this.placaMae});
  PlacaMaeDTO placaMae;

  @override
  Widget build(BuildContext context) {
    var processadorRepo = ProcessadorRepositoryImpl();

    return Scaffold(
      appBar: AppBar(
        title: Text("Processador"),
      ),
      body: FutureBuilder(
          future: processadorRepo.listar(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data as List<ProcessadorDTO>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var placa = data[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Finalizar(
                        compra: CompraDTO(placaMae: placaMae, processador: placa),
                      ),
                    )),
                    child: ListTile(
                      title: Text(placa.nome),
                      leading: Icon(Icons.production_quantity_limits),
                      subtitle: Text(placa.marca),
                      trailing: Text(placa.preco.toString()),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
