import 'dart:io';

import 'package:cultive/providers/change_provider.dart';
import 'package:cultive/services/plant_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:geocoding/geocoding.dart';

class RegisterPlant extends StatefulWidget {
  @override
  _RegisterPlantState createState() => _RegisterPlantState();
}

class _RegisterPlantState extends State<RegisterPlant> {
  String addressHintText = 'Clique no botão ao lado';
  Widget _messageImage =
      FittedBox(child: Text('Toque caso queira adicionar uma foto da planta.'));
  Position userPosition;
  String selectedValue;
  bool isLoading = false;

  TextEditingController nickname = TextEditingController();
  TextEditingController address = TextEditingController();

  final List<DropdownMenuItem> items = [
    DropdownMenuItem(child: Text('Samambaias'), value: 'Samambaias 1'),
    DropdownMenuItem(child: Text('Suculentas'), value: 'Suculentas 2'),
    DropdownMenuItem(child: Text('Cactos'), value: 'Cactos 3'),
    DropdownMenuItem(child: Text('Cara de Cavalo'), value: 'Cara de Cavalo 4'),
    DropdownMenuItem(
        child: Text('Comigo Ninguém Pode'), value: 'Comigo Ninguém Pode 5'),
    DropdownMenuItem(child: Text('Babosa'), value: 'Babosa 6'),
    DropdownMenuItem(
        child: Text('Espada de São Jorge'), value: 'Espada de São Jorge 7'),
    DropdownMenuItem(child: Text('Hibisco'), value: 'Hibisco 8'),
    DropdownMenuItem(child: Text('Girassol'), value: 'Girassol 9'),
    DropdownMenuItem(child: Text('Palmeiras'), value: 'Palmeiras 10'),
  ];

  PickedFile _image;
  final picker = ImagePicker();

  getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _messageImage = Expanded(
            child: Image.file(
          File(pickedFile.path),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: 120,
        ));
      }
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar Planta',
          style: TextStyle(
              fontFamily: 'OpenSans', color: Color(0xff272727), fontSize: 22),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Feather.x, color: Colors.grey.shade400)),
        backgroundColor: Colors.white,
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: getImage,
                child: Container(
                  height: 120,
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffD8E5DD),
                  child: Center(child: _messageImage),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Column(children: [
                  TextField(
                    controller: nickname,
                    decoration: InputDecoration(
                        labelText: '  Qual o apelido da Planta?'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SearchableDropdown.single(
                        items: items,
                        value: selectedValue,
                        icon: Icon(Feather.chevron_down),
                        hint: "Qual o nome popular da planta?",
                        searchHint: "Nome popular da planta",
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString().split(' ').last;
                          });
                        },
                        onClear: () {
                          setState(() {
                            selectedValue = '';
                          });
                        },
                        isExpanded: true,
                        closeButton: 'Fechar',
                        underline: Container(
                          height: 1.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black12, width: 2.0))),
                        )),
                  ),
                  TextField(
                    readOnly: true,
                    controller: address,
                    decoration: InputDecoration(
                        labelText: '  Endereço da plantinha',
                        hintText: addressHintText,
                        suffixIcon: IconButton(
                          icon: Icon(Ionicons.md_locate),
                          color: Color(0xff297F4E),
                          onPressed: () async {
                            List<Placemark> placeMark;
                            Position position =
                                await Geolocator.getCurrentPosition(
                                    desiredAccuracy: LocationAccuracy.high);
                            placeMark = await placemarkFromCoordinates(
                                position.latitude, position.longitude);
                            setState(() {
                              userPosition = position;
                              address.text =
                                  placeMark[0].subAdministrativeArea +
                                      ' - ' +
                                      placeMark[0].administrativeArea;
                            });
                          },
                        )),
                  ),
                ]),
              ),
              Container(
                  height: 40,
                  width: isLoading ? 40 : 250,
                  decoration: BoxDecoration(
                    color: Color(0xff297F4E),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.all(12),
                  child: isLoading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white, strokeWidth: 2.0)
                      : GestureDetector(
                          onTap: () => storePlant(context),
                          child: FittedBox(
                            child: Text(
                              'CADASTRAR PLANTA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ))
              // Container(
              //   // padding: EdgeInsets.all(10),
              //   child: RaisedButton(
              //     onPressed: () => storePlant(context),
              //     child: true ? CircularProgressIndicator(backgroundColor: Colors.white, strokeWidth: 2.0) : FittedBox(
              //                       child:
              //       ),
              //     ),
              //     color: Color(0xff297F4E),
              //     // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(50)),
              //   ),
              // )
            ],
          ),
        );
      }),
      backgroundColor: Colors.white,
    );
  }

  void storePlant(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    if (nickname.text == null ||
        selectedValue == null ||
        address.text == null ||
        _image == null) {
      _showSnackBar(context, "Prencha todos os campos");
      setState(() {
        isLoading = false;
      });
      return;
    }
    final _service = PlantService();
    await _service
        .storePlant(
            file: _image,
            plantId: selectedValue,
            latitude: userPosition.latitude.toString(),
            longitude: userPosition.longitude.toString(),
            nome: nickname.text)
        .then((value) {
      Provider.of<ChangeProvider>(context, listen: false).refresh();
      Navigator.of(context).pop();
    }).catchError((e) {
      _showSnackBar(context, "Ocorreu um problema inesperado");
      setState(() {
        isLoading = false;
      });
    });
  }

  _showSnackBar(BuildContext context, String text) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.red.shade400,
      ),
    );
  }
}
