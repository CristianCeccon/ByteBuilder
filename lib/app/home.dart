import 'package:bytebuilder/app/processador_screen.dart';
import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/infra/database/repository/placa_mae_repository_impl.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var placaRepository = PlacaMaeRepositoryImpl();

    return Scaffold(
      appBar: AppBar(
        title: Text("Placa Mãe"),
      ),
      body: FutureBuilder(
          future: placaRepository.listar(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data as List<PlacaMaeDTO>;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  PlacaMaeDTO placa = data[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProcessadorScreen(
                        placaMae: placa,
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
