import 'dart:convert';
import 'package:http/http.dart' as http;

Future<CepData> main(cep) async {
  String tipoRetorno = 'json';
  var url = Uri.http('viacep.com.br', '/ws/$cep/$tipoRetorno/');
  try{
    var resposta = await http.get(url);
    // print(json.decode(resposta.body).runtimeType);
    return CepData.fromJson(json.decode(resposta.body));
  }
  catch(e) {
    print('DEU RUIM $e');
    return CepData.nullValues();
  }
}

class CepData {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  CepData.fromJson(Map data) {
    cep = data["cep"];
    logradouro = data["logradouro"];
    complemento = data["complemento"];
    bairro = data["bairro"];
    localidade = data["localidade"];
    uf = data["uf"];
    ibge = data["ibge"];
    gia = data["gia"];
    ddd = data["ddd"];
    siafi = data["siafi"];
  }

  CepData.nullValues();
  CepData(this.cep, this.logradouro, this.complemento, this.bairro, this.localidade, this.uf, this.ibge, this.gia, this.ddd, this.siafi);
  
  @override
  String toString() {
    return "CepData => CEP: $cep\n Logradouro: $logradouro\n Complemento: $complemento\n Bairro: $bairro\n Localidade: $localidade\n UF: $uf\n IBGE: $ibge\n GIA: $gia\n DDD: $ddd\n SIAFI: $siafi";
  }
}