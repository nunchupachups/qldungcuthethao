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
              const PopupMenuItem<OrderOptions>(
                child: Text("Log out"),
              ),
            ],

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
            itemCount: 1,
            itemBuilder: (context, index){
              return GestureDetector(
                child: Column(
                  children: [
                    Card(
                      color: Color(0xFF2C384A),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          title: Text(
                            "Bóng tennis",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          subtitle: ReadMoreText("Với công nghệ dệt vải hiện đại giúp vỏ bóng Penn có độ bền, chống mài mòn rất cao. Ruột bóng làm bằng chất liệu cao su không nén khí, giúp bóng có độ nảy tốt hơn và độ bền cao hơn. Có độ bền rất cao, bóng này là sự lựa chọn lý tưởng cho các sân ngoài trời, nhựa hoặc bê tông. Điểm khác biệt là các sợi nỉ được trải đều, lõi là cao su tự nhiên cho cảm giác ổn định và giảm chấn tốt, sợi len được đan xen để nâng cao tuổi thọ của bóng.",
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
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("image/bongtennis.jpg"),
                                  fit:BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2C384A),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          title: Text(
                            "Dây kháng lực Mini Band",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          subtitle: ReadMoreText("Dây miniband, dây đàn hồi kháng lực tập gym thể hình tập chân mông Mini band Aolikes AL3603 là một phụ kiện tập luyện đa năng dành cho bất kì ai muốn cải thiện sức bền và vòng 3 quyến rũ.",
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
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("image/daykhangluc.jpg"),
                                  fit:BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2C384A),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          title: Text(
                            "Dây nhảy thể dục",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          subtitle: ReadMoreText("Dây nhảy giảm cân đốt mỡ bụng dây lõi thép đàn hồi có tạ 2.9m tập thể dục gym muay thái tăng thể lực sức khỏe tại nhà",
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
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("image/daynhay.jpg"),
                                  fit:BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2C384A),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          title: Text(
                            "Kìm bóp tay",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          subtitle:
                            ReadMoreText("Kìm bóp tay chữ A điều chỉnh lực là dụng cụ tập cơ tay bàn tay và ngón tay, đặc biệt thích hợp cho người tập võ, tập thể lực hoặc cho nhân viên văn phòng muốn luyện tập cơ tay do gõ bàn phím nhiều.",
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
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("image/kimboptay.jpg"),
                                  fit:BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),


                    Card(
                      color: Color(0xFF2C384A),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          title: Text(
                            "Kính bơi tráng gương",
                            style: TextStyle(
                                color: Colors.tealAccent,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          subtitle: ReadMoreText("Kính bơi tráng gương người lớn, trẻ em chống nước, chống mờ bảo vệ mắt, có bịt tai kèm hộp đựng thời trang cao cấp",
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
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("image/kinhboi.jpg"),
                                  fit:BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                onTap: (){
                  _showOptions();
                },
              );
            }),
        ],
      ),
    );
  }

  // Widget _dataCard(BuildContext context, int index){
  //   return GestureDetector(
  //     child: Card(
  //       color: Color(0xFF2C384A),
  //       child: Padding(
  //         padding: EdgeInsets.all(16),
  //         child: ListTile(
  //           title: Text(
  //             data[index].name ?? "",
  //             style: TextStyle(
  //               color: Colors.tealAccent,
  //               fontSize: 22.0,
  //               fontWeight: FontWeight.bold
  //             ),
  //           ),
  //
  //           subtitle: ReadMoreText(
  //             data[index].description??"",
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               color: Colors.white,
  //             ),
  //             trimLines: 2,
  //             colorClickableText: Colors.blue,
  //             trimMode: TrimMode.Line,
  //             trimCollapsedText: 'more',
  //             trimExpandedText: 'less',
  //             moreStyle: TextStyle(
  //               fontSize: 14,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.red
  //             ),
  //           ),
  //           leading: Container(
  //             width: 80.0,
  //             height: 80.0,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               image: DecorationImage(
  //                 image: data[index].img !=null
  //                     ? FileImage(File(data[index].img))
  //                     : AssetImage("image/pngegg.png"),
  //                 fit:BoxFit.cover),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     onTap: (){
  //       _showOptions(context, index);
  //     },
  //   );
  // }

  void _showOptions(){
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Xác nhận"),
                                content: Text("Bạn muốn xoá dụng cụ này?"),
                                shape: RoundedRectangleBorder(
                                    side:  BorderSide(color: Colors.green,width: 3),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                actions: [
                                  ElevatedButton(
                                      child: Text("Xoá"),
                                      onPressed: (){
                                        Navigator.of(context).pop(true); // Return true
                                      }
                                  ),
                                  ElevatedButton(
                                      child: Text("Huỷ"),
                                      onPressed: (){
                                        Navigator.of(context).pop(false); // Return false
                                      }
                                  ),
                                ],
                              );
                            });

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

    }
  }



}