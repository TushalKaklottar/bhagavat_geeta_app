import 'package:bhagavat_geeta_app/controller/json_provider.dart';
import 'package:bhagavat_geeta_app/controller/theme_provider.dart';
import 'package:bhagavat_geeta_app/modals/gita_modals.dart';
import 'package:bhagavat_geeta_app/view/screen/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    elevation: 5,
                    shadowColor: Colors.white,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      ]
                    ),
                  ),
                );
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 30,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 10,
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
