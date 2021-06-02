import 'package:flutter/material.dart';
import 'package:qr_scanner/screen/mark_attendance.dart';
import 'package:qr_scanner/service/get_attendance_data.dart';

class HomePage extends StatefulWidget {
  final String email;
  HomePage(this.email);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0;
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingData();
  }

  void loadingData() async {
    var r = await AttendanceData().getData(widget.email);
    data = r.docs;
    print(data.length);
    setState(() {
      x = 5;
    });
  }

  int xx = 0xFFFFFFFF;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Scanner'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MarkAttendence(widget.email);
                }));
              })
        ],
      ),
      body: Container(
        child: x == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return SafeArea(
                      child: ListTile(
                        title: Text(data[index]['date']),
                        trailing: Icon(
                          Icons.circle,
                          color: data[index]['present']
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
