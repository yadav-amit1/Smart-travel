import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_travel_planning_appli/Home/Pokhara_package/Puser_model.dart';

class FetchPUserlist {
  var data = [];
  List<PUserlist> results = [];
  String urlList = 'https://jsonkeeper.com/b/1UAZ';

  Future<List<PUserlist>> getPuserlist({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => PUserlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.ppname.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}