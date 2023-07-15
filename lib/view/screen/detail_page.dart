import 'package:bhagavat_geeta_app/controller/json_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detail_Page extends StatelessWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic index = ModalRoute.of(context)!.settings.arguments;
   return Scaffold(
     appBar: AppBar(
       title: Text(Provider.of<JSONProvider>(context).allGita[index].name),
     ),
   );
  }
}
//GitaModal data = p.allGita[index];