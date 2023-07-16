import 'package:bhagavat_geeta_app/controller/json_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/theme_provider.dart';

class Detail_Page extends StatelessWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic index = ModalRoute.of(context)!.settings.arguments;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
   return Scaffold(
     appBar: AppBar(
       leading: IconButton(
         onPressed: () {
           Navigator.pop(context);
         }, icon: const Icon(Icons.arrow_back_ios,
       ),
         color: Provider.of<ThemeProvider>(context).isDark ? Colors.black : Colors.white,
       ),
       backgroundColor: Provider.of<ThemeProvider>(context).isDark ? Colors.white : Colors.black,
       leadingWidth: 50,
       title: Text(Provider.of<JSONProvider>(context).allGita[index].name,
         style: GoogleFonts.akshar(
           fontWeight: FontWeight.w500,
           letterSpacing: 1,
           fontSize: 18,
           color: Provider.of<ThemeProvider>(context).isDark ? Colors.black : Colors.white,
         ),
       ),
     ),
   );
  }
}
