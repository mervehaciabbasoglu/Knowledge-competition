import 'package:bilgitesti/soru.dart';
import 'package:bilgitesti/test_veri.dart';
import 'package:flutter/material.dart';
import 'constants.dart';



void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({Key? key}) : super(key: key);

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {

 List <Widget> secimler=[];

 TestVeri test_1=TestVeri();
 void butonFonksiyonu (bool secilenButon){
   if(test_1.testBittiMi()==true){
     //alertDialog gösterecek
     //indexi sıfırla
     //secimleri sıfırla
     showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             title: new Text("Tebrikler Testi Bitirdiniz :)"),
             //content: new Text("Alert Dialog body"),
             actions: <Widget> [
               new TextButton(
                   onPressed: () {
                     Navigator.of(context).pop();

                     setState((){
                       test_1.testiSifirla();
                       secimler = [];
                     });
                   },
                   child: new Text("Başa Dön")),
             ],
           );
         }
     );

   } else
   {
     setState(() {
       test_1.getSoruYaniti() == secilenButon
           ? secimler.add(kDogruIconu)
           : secimler.add(kYanlisIconu);
       test_1.sonrakiSoru();
     });
   }
 }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.end,
          runSpacing: 3,
          spacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);
                          },
                        ))),
                Row(),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                        ),
                    ),
                ),
              ])),
        ),
      ],
    );
  }
}


