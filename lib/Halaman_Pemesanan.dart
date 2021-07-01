import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:deliverylaundry/Daftar_Menu.dart';
import 'package:deliverylaundry/Halaman_Riwayat_Pemesanan.dart';
import 'package:deliverylaundry/proses/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

//Todo: Halaman Pemesanan
class pemesananview extends StatelessWidget {

  //Todo: Mendapatkan ID User
  static get user => FirebaseAuth.instance.currentUser;

  //Todo: Variabel Data Form Yang Diinput
  final formKey = GlobalKey<FormState>();

  final alamat = TextEditingController();
  final total_barang = TextEditingController();
  final total_berat = TextEditingController();
  final tgl_antar = TextEditingController();
  final tgl_ambil = TextEditingController();
  final catatan = TextEditingController();

  final format_tanggal = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'PEMESANAN LAUNDRY',
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

        //Todo: Form Pemesanan
        child: Form(
          key: formKey,
          child: Card(
            margin: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.white.withOpacity(0.8),
            elevation: 5.0,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    //Todo: Aturan Pemesanan
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, right: 15.0, left: 15.0,bottom: 10.0),
                      child: Text(
                        'Aturan Pemesanan',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text('1'),
                            title: Text('Laundry hanya menerima barang dengan total berat < 10kg'),
                          ),
                          ListTile(
                            leading: Text('2'),
                            title: Text('Harga laundry per kg adalah Rp. 6000'),
                          ),
                          ListTile(
                            leading: Text('3'),
                            title: Text('Waktu pengerjaan untuk barang < 5 kg adalah 2 hari, sedangkan untuk <10 kg adalah 4 hari, selain itu tidak menerima pesanan'),
                          ),
                          ListTile(
                            leading: Text('4'),
                            title: Text('Metode pembayaran adalah bayar ditempat pada saat barang selesai dicuci'),
                          ),
                        ],
                      ),
                    ),

                    //Todo: Jumlah Barang
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: TextFormField(
                        controller: total_barang,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "5",
                          labelText: "Jumlah Barang",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jumlah barang tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    //Todo: Total Berat Barang
                    Padding(
                      padding: const EdgeInsets.only(top:15.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: TextFormField(
                        controller: total_berat,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "5 kg",
                          labelText: "Total Berat Barang",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Total berat barang tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    //Todo: Tanggal Diambil
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: tgl_ambil,
                        keyboardType: TextInputType.datetime,
                        decoration: new InputDecoration(
                          hintText: "10-06-2021",
                          labelText: "Tanggal Diambil",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_tanggal,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Tanggal diambil tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    //Todo: Lokasi Pengambilan
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: TextFormField(
                        controller: alamat,
                        keyboardType: TextInputType.streetAddress,
                        decoration: new InputDecoration(
                          hintText: "Jalan Cendana",
                          labelText: "Lokasi Pengambilan",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Lokasi pengambilan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    //Todo: Tanggal Diantar
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: DateTimeField(
                        controller: tgl_antar,
                        keyboardType: TextInputType.datetime,
                        decoration: new InputDecoration(
                          hintText: "15-06-2021",
                          labelText: "Tanggal Diantar",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        format: format_tanggal,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                        },
                        validator: (value) {
                          if (value  == null) {
                            return 'Tanggal diantar tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    //Todo: Catatan
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: TextFormField(
                        controller: catatan,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: "Jangan disetrika panas-panas",
                          labelText: "Catatan",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Catatan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:15.0 ,bottom: 25.0,),
                    ),

                    //Todo: Konfirmasi
                    Padding(
                      padding: const EdgeInsets.only(top:5.0, right: 15.0, left: 15.0,bottom: 5.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            "Konfirmasi",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color: Colors.deepPurple,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var total_berat_int = int.parse(total_berat.text);
                            var biaya = total_berat_int*6000;

                            if(total_berat_int <= 5){
                              var estimasi = 2;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [

                                          ListTile(
                                            title: Text(
                                              'Terimakasih sudah menggunakan jasa kami. Berikut riwayat pemesanan anda',
                                              style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),

                                          ListTile(
                                            leading : Text('Jumlah Barang'),
                                            title: Text(':'),
                                            trailing: Text(total_barang.text),
                                          ),
                                          ListTile(
                                            leading : Text('Total Berat Barang'),
                                            title: Text(':'),
                                            trailing: Text(total_berat.text),
                                          ),
                                          ListTile(
                                            leading : Text('Tanggal Diambil'),
                                            title: Text(':'),
                                            trailing: Text(tgl_ambil.text),
                                          ),
                                          ListTile(
                                            leading : Text('Lokasi Pengambilan'),
                                            title: Text(':'),
                                            trailing: Text(alamat.text),
                                          ),
                                          ListTile(
                                            leading : Text('Tanggal Diantar'),
                                            title: Text(':'),
                                            trailing: Text(tgl_antar.text),
                                          ),
                                          ListTile(
                                            leading : Text('Catatan'),
                                            title: Text(':'),
                                            trailing: Text(catatan.text),
                                          ),
                                          ListTile(
                                            leading : Text('Estimasi'),
                                            title: Text(':'),
                                            trailing: Text('$estimasi' + ' hari'),
                                          ),
                                          ListTile(
                                            leading : Text('Biaya'),
                                            title: Text(':'),
                                            trailing: Text('Rp.' + '$biaya'),
                                          ),


                                          ListTile(
                                            title: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              child: Text(
                                                "Kirim",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              color: Colors.deepPurple,

                                              onPressed: () async {
                                                if (formKey.currentState!.validate()) {

                                                  await Database.addItem(
                                                    alamat: alamat.text,
                                                    catatan: catatan.text,
                                                    tgl_ambil: tgl_ambil.text,
                                                    tgl_antar: tgl_antar.text,
                                                    total_barang: total_barang.text,
                                                    total_berat: total_berat.text,
                                                    estimasi: '$estimasi',
                                                    biaya: '$biaya',
                                                  );
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => new AlertDialog(
                                                      title: Text('Pemesanan loundry berhasil dibuat, tunggu beberapa saat kami akan menghubungi anda segera'),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            'Close',
                                                            style: TextStyle(
                                                              color: Colors.deepPurple,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: daftarmenu(user: user,)));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            else if(total_berat_int <= 10 ){
                              var estimasi = 4;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the that user has entered by using the
                                    // TextEditingController.
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [

                                          ListTile(
                                            title: Text(
                                              'Terimakasih sudah menggunakan jasa kami. Berikut riwayat pemesanan anda',
                                              style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),

                                          ListTile(
                                            leading : Text('Jumlah Barang'),
                                            title: Text(':'),
                                            trailing: Text(total_barang.text),
                                          ),
                                          ListTile(
                                            leading : Text('Total Berat Barang'),
                                            title: Text(':'),
                                            trailing: Text(total_berat.text),
                                          ),
                                          ListTile(
                                            leading : Text('Tanggal Diambil'),
                                            title: Text(':'),
                                            trailing: Text(tgl_ambil.text),
                                          ),
                                          ListTile(
                                            leading : Text('Lokasi Pengambilan'),
                                            title: Text(':'),
                                            trailing: Text(alamat.text),
                                          ),
                                          ListTile(
                                            leading : Text('Tanggal Diantar'),
                                            title: Text(':'),
                                            trailing: Text(tgl_antar.text),
                                          ),
                                          ListTile(
                                            leading : Text('Catatan'),
                                            title: Text(':'),
                                            trailing: Text(catatan.text),
                                          ),
                                          ListTile(
                                            leading : Text('Estimasi'),
                                            title: Text(':'),
                                            trailing: Text('$estimasi' + ' hari'),
                                          ),
                                          ListTile(
                                            leading : Text('Biaya'),
                                            title: Text(':'),
                                            trailing: Text('Rp.' + '$biaya'),
                                          ),


                                          ListTile(
                                            title: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              child: Text(
                                                "Kirim",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                              color: Colors.deepPurple,

                                              onPressed: () async {
                                                if (formKey.currentState!.validate()) {

                                                  await Database.addItem(
                                                    alamat: alamat.text,
                                                    catatan: catatan.text,
                                                    tgl_ambil: tgl_ambil.text,
                                                    tgl_antar: tgl_antar.text,
                                                    total_barang: total_barang.text,
                                                    total_berat: total_berat.text,
                                                    estimasi: '$estimasi',
                                                    biaya: '$biaya',
                                                  );
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => new AlertDialog(
                                                      title: Text('Pemesanan loundry berhasil dibuat, tunggu beberapa saat kami akan menghubungi anda segera'),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            'Close',
                                                            style: TextStyle(
                                                              color: Colors.deepPurple,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(context, PageTransition(type: PageTransitionType.fade, duration: Duration(seconds: 1), child: daftarmenu(user: user,)));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: ListTile(
                                      title: Text(
                                        'Peringatan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Icon(
                                        Icons.warning_amber_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                    content: Text('Pemesanan Tidak Boleh Lebih Dari 10 Kg'),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                          'Coba Lagi',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 55.0,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
