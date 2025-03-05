import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.orange,)),
                     Text(
                          "Read News",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                    SizedBox(width: 15,)
                  ],
                ),
                SizedBox(height: 100,),
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/news.png"),
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire container
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
                SizedBox(height: 60,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rules of Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.left,),
                    SizedBox(height: 20,),
                    Text("1. Keep scrolling for 10 minutes.",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500),),
                    SizedBox(height: 12,),
                    Text("2. Keep clicking every 30 seconds.",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500),),
                    SizedBox(height: 12,),
                    Text("3. Don't leave still screen for more than 30 seconds.",style: GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, "/newsTask");},
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7931A),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),

                      child:  Text(
                          "Start Task",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ),

              ]
          ),
        ),
      ),
    );
  }
}
