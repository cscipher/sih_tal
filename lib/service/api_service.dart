import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sih_tal/model/respModel.dart';

enum Field { humidity, temperature, xcoord, ycoord, gasComp }

class FieldValues {
  String getFieldName(Field field) {
    switch (field) {
      case Field.humidity:
        return 'Humidity';
      case Field.temperature:
        return 'Temperature';
      case Field.xcoord:
        return 'X-Coordinate';
      case Field.ycoord:
        return 'Y-Coordinate';
      case Field.gasComp:
        return 'GasComposition';
      default:
        return 'Unknown';
    }
  }
}

class ApiService {
  final String _baseUrl = 'https://api.thingspeak.com/channels/';
  final String _channelId = '1692748';
  final String _apiKey = '43HC02Y1L8Y9Q3HK';

  final Map<String, int> _field = {
    'Humidity': 1,
    'Temperature': 2,
    'X-Coordinate': 3,
    'Y-Coordinate': 4,
    'GasComposition': 5
  };

  void initState() {
    print('ApiService initialized');
  }

  int _getFieldId(String f) => _field[f]!;

  // example
  // https://api.thingspeak.com/channels/1692748/fields/field1/last?api_key=43HC02Y1L8Y9Q3HK

  Future<double> httpGetFieldVal(Field f) async {
    final int fName = _getFieldId(FieldValues().getFieldName(f));
    final url = Uri.parse(
        '$_baseUrl$_channelId/fields/field$fName/last?api_key=$_apiKey');
    final response = await http.get(url);
    final k = json.decode(response.body);
    double v = k.toDouble();
    return v;
  }

  Future<List<ThingSpeakFields>> httpGetFields({int results = 1}) async {
    final url = Uri.parse(
        '$_baseUrl$_channelId/feeds.json?api_key=$_apiKey&results=$results');
    final response = await http.get(url);
    final jsonData = json.decode(response.body);
    List<ThingSpeakFields> fieldsData = [];

    for (var f in jsonData['feeds']) {
      fieldsData.add(ThingSpeakFields.fromJson(f));
    }
    return fieldsData;
  }
}
