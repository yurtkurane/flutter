import 'package:flutter/material.dart';

// auto execute
void main() {
  // flutter'ı initialize eden runApp

  // widget => en küçükten en büyüğe giden şablonlar

  // named & unnamed paramaters

  // constant 
    runApp(MaterialApp(
    home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: MyProfileWidget(),
    ),
  ));
}

class MyProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398,
      height: 800,
      padding: const EdgeInsets.only(
        top: 139,
        left: 84,
        right: 85,
        bottom: 356,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFF673AB7)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 201,
            height: 201,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 201,
                    height: 201,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 212,
                    height: 212,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://avatars.githubusercontent.com/u/133433679?v=4"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          const SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Elif Yurtkuran',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Tobeto - Mobil Geliştirici -1B\n31.10.2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


   
// format document => shift +option + F // cmd+i => parantez içi kullanabilirlerin çıkması için 


// Stateless => UI 
// Stateful => Dynamic UI

// resim -> 
// İsim Soyisim
// tobeto - mobil geliştirme -1b
// günün tarihi (statik) 31.10.2023


