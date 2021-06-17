import 'package:deliverylaundry/Halaman_Login.dart';
import 'package:deliverylaundry/Halaman_Pemesanan.dart';
import 'package:deliverylaundry/Halaman_Profil.dart';
import 'package:deliverylaundry/Halaman_Riwayat_Pemesanan.dart';
import 'package:deliverylaundry/Halaman_Tentang_Kami.dart';
import 'package:deliverylaundry/proses/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class daftarmenu extends StatefulWidget {
  const daftarmenu({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _daftarmenuState createState() => _daftarmenuState();
}

class _daftarmenuState extends State<daftarmenu> {

  static get user => FirebaseAuth.instance.currentUser;

  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => loginview(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'DELIVERY LAUNDRY',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              color: Colors.deepPurple,
              child: InkWell(
                onTap: () async {
                  setState(() {
                    _isSigningOut = true;
                  });
                  await Authentication.signOut(context: context);
                  setState(() {
                    _isSigningOut = false;
                  });
                  Navigator.of(context)
                      .pushReplacement(_routeToSignInScreen());
                },
                child: Icon(Icons.power_settings_new),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("file/mesincuci.jpg"),
                fit: BoxFit.cover)
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Todo: Button Pemesanan Loundry
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.deepPurple,
                    child: InkWell(
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: pemesananview()));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: ListTile(
                          title: Text(
                            'Pemesanan Laundry',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Todo: Riwayat Pemesanan
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.deepPurple,
                    child: InkWell(
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: riwayatpemesanan(user: user)));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: ListTile(
                          title: Text(
                            'Riwayat Pemesanan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Todo: Tentang Kami
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.deepPurple,
                    child: InkWell(
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: tentangkami()));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: ListTile(
                          title: Text(
                            'Tentang Kami',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //Todo: Button Profil
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.deepPurple,
                    child: InkWell(
                      splashColor: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: profilview(user: user)));
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: ListTile(
                          title: Text(
                            'Profil',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
