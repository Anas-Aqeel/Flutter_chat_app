import 'package:chat_app_ui/home/utils/signout.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:flutter/material.dart';

class MyChatScreen extends StatefulWidget {
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: ListView(
            children: [
              Header(),
              SizedBox(
                height: 10,
              ),
              SearchBar(),
              SizedBox(
                height: 5,
              ),
              Container()
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}



class ConversationBox extends StatelessWidget {
  final txt;
  final caption;
  final dp;
  ConversationBox({this.dp, this.caption, this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[50],
                backgroundImage: AssetImage('$dp'),
                radius: 30,
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText('$txt',
                      size: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                  SizedBox(
                    height: 4,
                  ),
                  PrimaryText(
                    '$caption',
                    size: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black45,
                  ),
                ],
              )
            ],
          ),
          PrimaryText(
            'Today',
            size: 15,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey.shade600,
        size: 20,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade100)),
    ));
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryText(
          'Conversations',
          size: 30,
          fontWeight: FontWeight.w900,
        ),
        Row(children: [
          AddButton(),
          SizedBox(width: 3),
          PopupMenuButton(
              child: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: GestureDetector(
                          onTap: () {
                            signOut();
                            Navigator.pushNamed(context, '/AUTH');
                          },
                          child: Text("logout")),
                    ),
                    PopupMenuItem(
                      child: Text("Second"),
                    )
                  ])
        ]),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      highlightColor: Colors.pink[100],
      shape: StadiumBorder(),
      color: Colors.pink[50],
      child: Row(
        children: [
          Icon(
            Icons.add,
            size: 25,
            color: Colors.pink[500],
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            'Add New',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}

class PrimaryText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  PrimaryText(this.text,
      {this.fontWeight = FontWeight.w600,
      this.size = 16,
      this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
