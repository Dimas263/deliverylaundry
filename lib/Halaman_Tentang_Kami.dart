import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tentangkami extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'TENTANG KAMI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("file/mesincuci.jpg"),
                fit: BoxFit.cover)
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 25,right: 25, top: 25, bottom: 25),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15,right: 15, top: 15, bottom: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Image.asset('file/logo.png', fit: BoxFit.contain,),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15,right: 15, top: 15, bottom: 5),
                    child: Text(
                      'Delivery Loundry adalah usaha laundry melayani cucian rumah tangga, karpet, boneka, gordyn, bed cover, dan lain-lain. Hubungi kami untuk memesan laundry, cucian berkualitas, wangi dan bersih, harga murah, hasilnya puas. ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15,right: 15, top: 15, bottom: 5),
                    child: Text(
                      'Dikembangan Oleh',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15,right: 15, top: 5, bottom: 5),
                    child: Text(
                      'Dimas & Brigita',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15,right: 15, top: 25, bottom: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
