import 'dart:io';

import 'package:flutter/material.dart';
import 'package:piton_project_app/data/entity/podkes.dart';
import 'package:piton_project_app/ui/views/detail_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Future<List<Podkes>> podkesleriYukle() async{
    var podcasListesi = <Podkes>[];
    var p1 = Podkes(id: 1, sarki_ad: "The missing 96 percent of the universe", sarkici_ad: "Claire Malone", resim: "podkes_1.png");
    var p2 = Podkes(id: 2, sarki_ad: "How Dolly Parton led me to an apiphany", sarkici_ad: "Abumenyag", resim: "podkes_2.png");
    var p3 = Podkes(id: 3, sarki_ad: "The missing 96 percent of the universe", sarkici_ad: "Tir McDohl", resim: "podkes_3.png");
    var p4 = Podkes(id: 4, sarki_ad: "Ngobam with Denny Caknan", sarkici_ad: "Denny Kulon", resim: "podkes_4.png");

    podcasListesi.add(p1);
    podcasListesi.add(p2);
    podcasListesi.add(p3);
    podcasListesi.add(p4);
    return podcasListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2C),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Sol üst köşedeki ikon
          onPressed: () {},
        ),
        title: const Center(
          child: Text("Podkes", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF2C2C38),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [//404054FF
                SizedBox( width: 80,height: 40,
                    child: ElevatedButton(onPressed: (){},
                     style: ElevatedButton.styleFrom(backgroundColor: Color(0x40949498)),
                     child: Text("All",style: TextStyle(fontSize: 16,color: Colors.white),),)),

                SizedBox( width: 90,height: 40,
                    child: ElevatedButton(onPressed: (){},
                     style: ElevatedButton.styleFrom(backgroundColor: Color(0x40949498)),
                     child: Text("Life",style: TextStyle(fontSize: 16,color: Colors.white),),)),

                SizedBox( width: 110,height: 40,
                    child: ElevatedButton(onPressed: (){},
                     style: ElevatedButton.styleFrom(backgroundColor: Color(0x40949498)),
                     child: Text("Comedy",style: TextStyle(fontSize: 16,color:Colors.white),),)),

                SizedBox( width: 85,height: 40,
                    child: ElevatedButton(onPressed: (){},
                     style: ElevatedButton.styleFrom(backgroundColor: Color(0x40949498)),
                     child: Text("Tech",style: TextStyle(fontSize: 16,color: Colors.white),),)),
              ],
            ),
          ),
       Padding(
         padding: const EdgeInsets.only(left: 10.0),
         child: Text("Trending", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold), textAlign: TextAlign.left,
         ),
       ),
       Expanded(
      child: FutureBuilder<List<Podkes>>(
        future: podkesleriYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var podkesListesi = snapshot.data;
            return GridView.builder(
              itemCount: podkesListesi!.length,//4 podkes
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,//childAspectRatio: 1 /1.1 //oranlama
              ),
              itemBuilder: (context, indeks){//0,1,2,3,//döngü gibi calisacak
                var podkes = podkesListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(podkes: podkes)));
                  },
                  child: Card(
                    color: Color(0xFF1E1E2C),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Image.asset("pictures/${podkes.resim}",
                              fit: BoxFit.cover,
                              width: double.infinity, // Kartın genişliğine uyacak
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${podkes.sarki_ad}", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                              Text("${podkes.sarkici_ad}", style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
       ),
    ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1E1E2C),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
