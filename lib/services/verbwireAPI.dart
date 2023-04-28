// import 'package:http/http.dart'as http;

// var headers = {
//   'accept': 'application/json',
//   'X-API-Key': 'sk_live_de2d4861-7cf2-4079-9f6f-aa4ad2a76273'
// };
// var request = http.MultipartRequest('POST', Uri.parse('https://api.verbwire.com/v1/nft/deploy/deployContract'));
// request.fields.addAll({{
//   'chain': 'goerli',
//   'contractType': 'nft721',
//   'contractCategory': 'simple',
//   'isCollectionContract': 'false'
// }});

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) async{
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }