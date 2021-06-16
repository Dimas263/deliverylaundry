import 'dart:html';

import 'package:deliverylaundry/Halaman_Pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverylaundry/proses/database.dart';
import 'package:page_transition/page_transition.dart';

class riwayatpemesanan extends StatefulWidget {
  const riwayatpemesanan({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _riwayatpemesananState createState() => _riwayatpemesananState();
}

class _riwayatpemesananState extends State<riwayatpemesanan> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;
    Database.userUid = _user.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'RIWAYAT PEMESANAN',
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
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.readItems(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                  'Error',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              }
              else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                  //scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 16.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {

                    //id pesanan
                    var id = snapshot.data!.docs[index].id;
                    String documentid = id;

                    //info pesanan
                    var noteInfo = snapshot.data!.docs[index].data();
                    String alamat = noteInfo['alamat'];
                    String catatan = noteInfo['catatan'];
                    String tgl_ambil = noteInfo['tgl_ambil'];
                    String tgl_antar = noteInfo['tgl_antar'];
                    String jumlah_barang = noteInfo['jumlah_barang'];
                    String total_berat = noteInfo['total_berat'];
                    var a = 10; // An integer
                    var b = "20"; // A string
                    var c = int.parse(b);
                    var d = print(a + c);

                    return Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          //ID Pemesanan
                          ListTile(
                            leading: Text(
                              'ID Pemesanan'+'$a',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              documentid,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Tanggal Diambil
                          ListTile(
                            leading: Text(
                              'Tanggal Diambil',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              '${tgl_ambil}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Lokasi Pengambilan
                          ListTile(
                            leading: Text(
                              'Lokasi Pengambilan',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              '${alamat}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Tanggal Diantar
                          ListTile(
                            leading: Text(
                              'Tanggal Diantar',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              '${tgl_antar}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Jumlah Barang
                          ListTile(
                            leading: Text(
                              'Jumlah Barang',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              '${jumlah_barang}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Catatan
                          ListTile(
                            leading: Text(
                              'Catatan',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              catatan,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Total Berat
                          ListTile(
                            leading: Text(
                              'Total Berat',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              '$total_berat',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          //Total Biaya
                          ListTile(
                            leading: Text(
                              'Total Biaya',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            title: Text(':'),
                            trailing: Text(
                              'Rp.'+'${1*6000}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.blue,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, duration: Duration(seconds: 1), child: pemesananview()));
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}