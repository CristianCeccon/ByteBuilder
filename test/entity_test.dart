import 'package:bytebuilder/domain/data/placa_mae_dto.dart';
import 'package:bytebuilder/domain/data/processador_dto.dart';
import 'package:bytebuilder/domain/entity/base.dart';
import 'package:bytebuilder/domain/entity/compra.dart';
import 'package:bytebuilder/domain/entity/placa_mae.dart';
import 'package:bytebuilder/domain/entity/processador.dart';
import 'package:bytebuilder/domain/exception/componente_incompativel.dart';
import 'package:bytebuilder/domain/exception/conteudo_invalido.dart';
import 'package:bytebuilder/domain/exception/preco_invalido.dart';
import 'package:bytebuilder/domain/exception/valor_inavlido.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Base', () {
    test('Preço deve ser acima de 0', () {
      expect(
        () => Base(preco: 0, marca: "marca", nome: "nome").validarPreco(),
        throwsA(isA<PrecoInvalido>()),
      );
      expect(
        () => Base(preco: -1, marca: "marca", nome: "nome").validarPreco(),
        throwsA(isA<PrecoInvalido>()),
      );
      expect(
        Base(preco: 1, marca: "marca", nome: "nome").validarPreco(),
        null,
      );
    });

    test('Nome não pode ser vazio', () {
      expect(
        () => Base(preco: 10, nome: "", marca: "marca").validarNome(),
        throwsA(isA<ConteudoInvalido>()),
      );
      expect(
        Base(preco: 10, nome: "Nome teste", marca: "marca").validarNome(),
        null,
      );
    });

    test('Marca não pode ser vazia', () {
      expect(
        () => Base(preco: 10, nome: "nome", marca: "").validarMarca(),
        throwsA(isA<ConteudoInvalido>()),
      );
      expect(
        Base(preco: 10, nome: "nome", marca: "Marca Teste").validarMarca(),
        null,
      );
    });
  });

  group('Processador', () {
    test('Frequência precisa ser entre 1 e 1000', () {
      expect(
        () => Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 0,
            nucleo: 1,
            socket: "a",
          ),
        ),
        throwsA(isA<ValorInvalido>()),
      );

      expect(
        () => Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1001,
            nucleo: 1,
            socket: "a",
          ),
        ),
        throwsA(isA<ValorInvalido>()),
      );
      expect(
        Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 1,
            socket: "a",
          ),
        ),
        isA<Processador>(),
      );

      expect(
        Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1000,
            nucleo: 1,
            socket: "a",
          ),
        ),
        isA<Processador>(),
      );
    });

    test('Núcleo precisa ser entre 1 e 1000', () {
      expect(
        () => Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 0,
            socket: "a",
          ),
        ),
        throwsA(isA<ValorInvalido>()),
      );
      expect(
        () => Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 1001,
            socket: "a",
          ),
        ),
        throwsA(isA<ValorInvalido>()),
      );
      expect(
        Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 1,
            socket: "a",
          ),
        ),
        isA<Processador>(),
      );
      expect(
        Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 1000,
            socket: "a",
          ),
        ),
        isA<Processador>(),
      );
    });

    test('Socket não pode ser vazio', () {
      expect(
        () => Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 1,
            socket: "",
          ),
        ),
        throwsA(isA<ConteudoInvalido>()),
      );

      expect(
        Processador.criar(
          ProcessadorDTO(
            preco: 1.0,
            marca: "marca",
            nome: "nome",
            frequencia: 1,
            nucleo: 1,
            socket: "socket",
          ),
        ),
        isA<Processador>(),
      );
    });
  });

  group('Placa Mae', () {
    test('DDR entre 1 e 10', () {
      expect(
        () => PlacaMae.criar(PlacaMaeDTO(
          preco: 1.0,
          marca: "marca",
          nome: "nome",
          ddr: 0,
          socket: "socket",
        )),
        throwsA(isA<ValorInvalido>()),
      );

      expect(
        () => PlacaMae.criar(PlacaMaeDTO(
          preco: 1.0,
          marca: "marca",
          nome: "nome",
          ddr: 11,
          socket: "socket",
        )),
        throwsA(isA<ValorInvalido>()),
      );
      expect(
        PlacaMae.criar(PlacaMaeDTO(
          preco: 1.0,
          marca: "marca",
          nome: "nome",
          ddr: 1,
          socket: "socket",
        )),
        isA<PlacaMae>(),
      );
      expect(
        PlacaMae.criar(PlacaMaeDTO(
          preco: 1.0,
          marca: "marca",
          nome: "nome",
          ddr: 10,
          socket: "socket",
        )),
        isA<PlacaMae>(),
      );
    });

    test('Socket não pode ser vazio', () {
      expect(
        () => PlacaMae.criar(PlacaMaeDTO(
          preco: 1.0,
          marca: "marca",
          nome: "nome",
          ddr: 1,
          socket: "",
        )),
        throwsA(isA<ConteudoInvalido>()),
      );

      expect(
        PlacaMae.criar(PlacaMaeDTO(
          preco: 1.0,
          marca: "marca",
          nome: "nome",
          ddr: 1,
          socket: "socket",
        )),
        isA<PlacaMae>(),
      );
    });
  });

  group('Compra', () {
    test('Compra compatibilidade', () {
      expect(
        () => Compra.criar(
          PlacaMae.criar(
            PlacaMaeDTO(
              preco: 1.0,
              marca: "marca",
              nome: "nome",
              ddr: 1,
              socket: "LGA1151",
            ),
          ),
          Processador.criar(
            ProcessadorDTO(
              preco: 1.0,
              marca: "marca",
              nome: "nome",
              frequencia: 1,
              nucleo: 1,
              socket: "AM4",
            ),
          ),
        ),
        throwsA(isA<ComponenteIncompativel>()),
      );

      expect(
        Compra.criar(
          PlacaMae.criar(
            PlacaMaeDTO(
              preco: 1.0,
              marca: "marca",
              nome: "nome",
              ddr: 1,
              socket: "LGA1151",
            ),
          ),
          Processador.criar(
            ProcessadorDTO(
              preco: 1.0,
              marca: "marca",
              nome: "nome",
              frequencia: 1,
              nucleo: 1,
              socket: "LGA1151",
            ),
          ),
        ),
        isA<Compra>(),
      );
    });
  });
}
