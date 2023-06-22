import 'package:buscacep/buscacep.dart' as buscacep;
import 'dart:io';

Future<void> main() async {
  String cep = '';
  while (cep != '0'){
    stdout.write('Digite um CEP válido:');
    cep = stdin.readLineSync()!.replaceAll('-', '');
    if (cep.length == 8) {
      stdout.writeln('Buscando informações de $cep');
      buscacep.CepData resultado = await buscacep.main(cep);
      stdout.writeln(resultado.toString());
    }
    else {
      print('desse jeito aí não rola. tenta de novo');
    }
  }
}
