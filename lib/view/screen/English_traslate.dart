import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/json_provider.dart';

class Gita_English extends StatelessWidget {
  const Gita_English({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic index = ModalRoute
        .of(context)!
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(

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
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(p.allGita[index].chapter_number.toString(),
                            style: GoogleFonts.akshar(
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text('ADHYAY:-',
                            style: GoogleFonts.akshar(
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(p.allGita[index].name_translation,
                            style: GoogleFonts.akshar(
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Text(p.allGita[index].chapter_summary,
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
