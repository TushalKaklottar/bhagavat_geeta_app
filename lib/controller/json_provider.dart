import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../modals/gita_modals.dart';

class JSONProvider extends ChangeNotifier {

  List<GitaModal>  allGita = [];

  JSONProvider() {
    loadJson();
  }

  loadJson() async {
   String res = await rootBundle.loadString("json_file/gita.json");

   debugPrint("RESPONSE: $res");
   List allData = jsonDecode(res);
   debugPrint("LIST: $allData");

   allGita = allData.map((e) => GitaModal.fromMap(data: e)).toList();

   notifyListeners();
  }
}