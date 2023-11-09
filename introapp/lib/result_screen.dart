import 'package:flutter/material.dart';




class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


 return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tebrikler! Toplam doğru cevap sayısı: 5",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text("Yeni Oyuna Başla"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text("Ana Sayfaya Dön"),
            ),
          ],
        ),
      ),
    );
  }
}  
