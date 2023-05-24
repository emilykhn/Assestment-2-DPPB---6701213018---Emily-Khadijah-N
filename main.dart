import 'package:flutter/material.dart';
import 'secondpage.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("vsi2k4.assessment1"),
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() {
    return MyFormState();
  }
}


class MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {

    final _formState = GlobalKey<FormState>();

    final firstController = TextEditingController();
    final secondController = TextEditingController();
    final thirdController = TextEditingController();

    // int groupValue = 0;
    int? selectedValue = 0;

    bool switchValue = false;

    return Form(
      key: _formState,
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2, color: Colors.black54
                      )
                    ),
                  labelText: "Nama barang",
                  ),
                  controller: firstController,
                  validator: (value){
                    if (value == ''){
                      return "Please input some text";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  // Sizedbox(height: 15),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black54
                        )
                    ),
                    labelText: "Deskripsi",
                  ),
                  controller: secondController,
                  validator: (value){
                    if (value == ''){
                      return "Please input some text";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  // Sizedbox(height: 15),
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black54
                        )
                    ),
                    labelText: "Harga",
                  ),
                  controller: thirdController,
                  validator: (value){
                    if (value == ''){
                      return "Please input some text";
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(15),
                child: Text("Kondisi Barang",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              RadioListTile<int>(
                value: 1,
                groupValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                title: Text('Bekas'),
              ),
                RadioListTile<int>(
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  title: Text('Baru'),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Text('Pengiriman dalam kota saja',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(47, 0, 0, 0),
                      child: Switch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15,30,0,0),
                      child: Text('Menerima retur',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(175, 30, 0, 0),
                      child: Switch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.lightBlue, width: 2),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.lightBlue)
                  ),
                  onPressed: () {
                    List<String> formData = [];

                    String kirim1 = firstController.text;
                    String kirim2 = secondController.text;
                    String kirim3 = thirdController.text;


                    formData.add(kirim1);
                    formData.add(kirim2);
                    formData.add(kirim3);


                    if(_formState.currentState!.validate()){
                      print("Validation Success");
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => SecondLayout(data: formData)
                          )
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("Data berhasil disubmit."),
                        content: Text(
                            '1. Nama barang: ' + kirim1 + '\n'
                            '2. Deskripsi: ' + kirim2 + '\n'
                            '3. Harga: ' + kirim3 +'\n'
                            "Dikerjakan oleh: 6701213018 - Emily Khadijah N"),
                      );

                      showDialog(context: context,
                          builder: (BuildContext context) {
                            return alert;
                          }
                      );
                    } else{ print("Validation Failed"); }

                  },
                  child: const Text("PUBLIKASIKAN",
                  style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}


