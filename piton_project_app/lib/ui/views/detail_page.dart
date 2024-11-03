import 'package:flutter/material.dart';
import 'package:piton_project_app/data/entity/podkes.dart';

class DetailPage extends StatefulWidget {

  Podkes podkes;


  DetailPage({required this.podkes});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Now Playing",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF1E1E2C),
      ),
      body: Center(
        child: Column(
          children: [
          Image.asset("pictures/${widget.podkes.resim}",
            width: 300, // Genişlik
            height: 300, // Yükseklik
            fit: BoxFit.cover,// Resmi sığdırır
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0,left: 55),
            child: Text("${widget.podkes.sarki_ad}", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: Text("${widget.podkes.sarkici_ad}", style: TextStyle(color: Colors.grey,fontSize: 15),
            textAlign: TextAlign.left,
            ),
          ),
            SizedBox(
                width: 300,
                height: 100,
                child: Image.asset("pictures/fooo.png")),
             Image.asset("pictures/sure.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("pictures/play.png"),
            ),
          ],
        ),
      ),
    );
  }
}
