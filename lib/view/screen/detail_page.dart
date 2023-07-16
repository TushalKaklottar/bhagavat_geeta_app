import 'package:bhagavat_geeta_app/controller/json_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/theme_provider.dart';

class Detail_Page extends StatelessWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic index = ModalRoute
        .of(context)!
        .settings
        .arguments;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
              onTap: () {
    Navigator.of(context).pushNamed('gita_english',arguments: index);
    },
                child: Text("ENGLISH",
                style: GoogleFonts.akshar(
                  letterSpacing: 1,
                  color: Provider
                      .of<ThemeProvider>(context)
                      .isDark ? Colors.black : Colors.white,
                ),
                ),
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios,
          ),
            color: Provider
                .of<ThemeProvider>(context)
                .isDark ? Colors.black : Colors.white,
          ),
          backgroundColor: Provider
              .of<ThemeProvider>(context)
              .isDark ? Colors.white : Colors.black,
          leadingWidth: 50,
          title: Text(Provider
              .of<JSONProvider>(context)
              .allGita[index].name,
            style: GoogleFonts.akshar(
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize: 18,
              color: Provider
                  .of<ThemeProvider>(context)
                  .isDark ? Colors.black : Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<JSONProvider>(builder: (context,p,_) {
                return p.allGita.isNotEmpty ?
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 120,
                            backgroundImage: NetworkImage(p.allGita[index].imageName),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(p.allGita[index].chapter_number.toString(),
                                style: GoogleFonts.akshar(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text('अध्याय :-',
                                style: GoogleFonts.akshar(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(p.allGita[index].name,
                              style: GoogleFonts.akshar(
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                              ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Text(p.allGita[index].chapter_summary_hindi,
                                style: GoogleFonts.akshar(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ) : const Center(
                  child: CircularProgressIndicator(),
                );
    }
          )
          ),
        ),
    );
  }
}
