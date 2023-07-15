import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/gita_modals.dart';
import '../../controller/json_provider.dart';

class Detail_Page extends StatelessWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<JSONProvider>(builder: (context,p,_) {
      return p.allGita.isNotEmpty
          ? AppBar(
      ) : Center(
        child: CircularProgressIndicator(),
      );
    }
    );
  }
}
//GitaModal data = p.allGita[index];