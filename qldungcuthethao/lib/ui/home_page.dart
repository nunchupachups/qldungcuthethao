import 'dart:io';
import 'package:qldungcuthethao/helpers/sql_helper.dart';
import 'package:qldungcuthethao/modul/modul_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'data_page.dart';

enum OrderOptions {orderaz, orderza}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  SqlHelper helper = SqlHelper();

  List<Data> data = List();

  @override
  void initState(){
    super.initState();
    _getAllData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý dụng cụ thể thao"),
        backgroundColor: Color(0xFF4285F4),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
              const PopupMenuItem<OrderOptions>(
                child: Text("Sort to A-Z"),
                value: OrderOptions.orderaz,
              ),
              const PopupMenuItem<OrderOptions>(
                child: Text("Sort to Z-A"),
                value: OrderOptions.orderza,
              ),
            ],
            onSelected: _sortList,
          )
        ],
      ),
      backgroundColor: Color(0xFFECEFF1),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDataPage();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: data.length,
            itemBuilder: (context, index){
              return _dataCard(context, index);
            }),
        ],
      ),
    );
  }

  Widget _dataCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        color: Color(0xFF2C384A),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListTile(
            title: Text(
              data[index].name ?? "",
              style: TextStyle(
                color: Colors.tealAccent,
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              ),
            ),

            subtitle: ReadMoreText(
              data[index].description??"",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              trimLines: 2,
              colorClickableText: Colors.blue,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'more',
              trimExpandedText: 'less',
              moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),
            ),
            leading: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: data[index].img !=null
                      ? FileImage(File(data[index].img))
                      : AssetImage("image/pngegg.png"),
                  fit:BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
      onTap: (){
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
      context: context,
      builder: (context){
        return BottomSheet(
          onClosing: (){},
          builder: (context){
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Icon(
                        Icons.edit,
                        size: 40.0,
                        color: Colors.blue,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                        _showDataPage(data: data[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Icon(
                        Icons.delete,
                        size: 40.0,
                        color: Colors.blue,
                      ),
                      onPressed: (){
                        helper.deleteData(data[index].id);
                        setState(() {
                          data.removeAt(index);
                          Navigator.pop(context);
                        });
                    },
                  ),
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }

  void _showDataPage({Data data}) async{
    final recData = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => DataPage(data: data))
    );
    if(recData !=null){
      if(data != null){
        await helper.updateData(recData);
      }else{
        await helper.insertData(recData);
      }
      _getAllData();
    }
  }

  void _getAllData(){
    helper.getData().then((list){
      setState(() {
        data = list;
      });
    });
  }

  void _sortList(OrderOptions result){
    switch (result){
      case OrderOptions.orderaz:
        data.sort((a,b){
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());

        });
        break;

      case OrderOptions.orderza:
        data.sort((a,b){
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }
    setState((){});
  }
}