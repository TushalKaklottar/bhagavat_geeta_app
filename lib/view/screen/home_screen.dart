import 'package:bhagavat_geeta_app/controller/json_provider.dart';
import 'package:bhagavat_geeta_app/controller/theme_provider.dart';
import 'package:bhagavat_geeta_app/modals/gita_modals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("BHAGVAT GITA",
        style: GoogleFonts.akshar(
          fontWeight: FontWeight.w500,
          letterSpacing: 1
        ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context,listen: false).changeTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(Provider.of<ThemeProvider>(context,listen: false).isDark ? Icons.light_mode : Icons.light_mode_outlined),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<JSONProvider>(builder: (context,p,_) {
          return p.allGita.isNotEmpty
              ? GridView.builder(
              itemCount: p.allGita.length,
            itemBuilder: (context, index) {
                GitaModal data = p.allGita[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('detail_page',arguments: index);
                 },
                  child: Card(
                    elevation: 7,
                    shadowColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Center(
                            child: CircleAvatar(
                              radius: 60,
                              foregroundImage: NetworkImage(data.imageName),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(data.id.toString()),
                              Text("."),
                              Padding(
                                padding:  EdgeInsets.only(top: 1,left: 1),
                                child: Text(data.name.toString(),
                                style: GoogleFonts.akshar(
                                  fontSize: 13
                                ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                )
                );
            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 40,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisExtent: 180,
          ),
          ) : const Center(
            child: CircularProgressIndicator(),
          );
        }
        )
      ),
    );
  }
}
