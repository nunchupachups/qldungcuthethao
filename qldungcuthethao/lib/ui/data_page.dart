import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qldungcuthethao/modul/modul_data.dart';

class DataPage extends StatefulWidget{
  final Data data;

  DataPage({this.data});

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage>{
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _weightController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _nameFocus = FocusNode();
  final _brandFocus = FocusNode();
  final _weightFocus = FocusNode();
  final _categoryFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  bool _userEdited = false;

  Data _editData;

  @override
  void initState(){
    super.initState();

    if(widget.data == null){
      _editData = Data();
    }else{
      _editData = Data.fromMap(widget.data.toMap());
      _nameController.text = _editData.name;
      _brandController.text = _editData.brand;
      _weightController.text = _editData.weight;
      _categoryController.text = _editData.category;
      _descriptionController.text = _editData.description;
    }
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(_editData.name ?? "New Data"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if(_editData.name.isNotEmpty && _editData.name !=null ){
                Navigator.pop(context, _editData);
              }else if(_editData.brand.isNotEmpty && _editData.brand !=null ) {
                Navigator.pop(context, _editData);
              }else if(_editData.weight.isNotEmpty && _editData.weight !=null ) {
                Navigator.pop(context, _editData);
              }else if(_editData.category.isNotEmpty && _editData.category !=null ) {
                Navigator.pop(context, _editData);
              }else if(_editData.description.isNotEmpty && _editData.description !=null ) {
                Navigator.pop(context, _editData);
              }else{
                FocusScope.of(context).requestFocus(_nameFocus);
                FocusScope.of(context).requestFocus(_brandFocus);
                FocusScope.of(context).requestFocus(_weightFocus);
                FocusScope.of(context).requestFocus(_categoryFocus);
                FocusScope.of(context).requestFocus(_descriptionFocus);
              }
            },
            child: Icon(Icons.save),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _editData.img != null ? FileImage(File(_editData.img)) : AssetImage("image/pngegg.png"),
                        fit: BoxFit.cover),
                    ),
                  ),

                  onTap: (){
                    ImagePicker.pickImage(source: ImageSource.gallery).then((file){
                      if (file == null) return;
                      setState((){
                        _editData.img = file.path;
                      });
                    });
                  },
                ),
                TextField(
                  controller:  _nameController,
                  focusNode: _nameFocus,
                  decoration: InputDecoration(labelText: "Name"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editData.name = text;
                    });
                  },
                ),
                TextField(
                  controller:  _brandController,
                  focusNode: _brandFocus,
                  decoration: InputDecoration(labelText: "Brand"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editData.brand = text;
                    });
                  },
                ),
                TextField(
                  controller:  _weightController,
                  focusNode: _weightFocus,
                  decoration: InputDecoration(labelText: "Weight"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editData.weight = text;
                    });
                  },
                ),
                TextField(
                  controller:  _categoryController,
                  focusNode: _categoryFocus,
                  decoration: InputDecoration(labelText: "Category"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editData.category = text;
                    });
                  },
                ),
                TextField(
                  controller:  _descriptionController,
                  focusNode: _descriptionFocus,
                  decoration: InputDecoration(labelText: "Description"),
                  onChanged: (text){
                    _userEdited = true;
                    setState(() {
                      _editData.description = text;
                    });
                  },
                ),

              ],
            ),
          ),
        ),
    );
  }

  Future<bool> _requestPop(){
    if (_userEdited){
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog();
        }
      );
      return Future.value(false);
    }else{
      return Future.value(true);
    }
  }
}