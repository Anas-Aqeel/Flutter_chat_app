import 'package:chat_app_ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:simple_chat_application/Global/Colors.dart' as myColors;
// import 'package:simple_chat_application/View/ChatPageView.dart';

class ChatListViewItem extends StatelessWidget {
  final  image;
  final  name;
  final  lastMessage;
  final  time;
  final  hasUnreadMessage;
  final  newMesssageCount;
  final  function;
  const ChatListViewItem({
    this.image,
    this.name,
    this.lastMessage,
    this.time,
    this.hasUnreadMessage,
    this.newMesssageCount,
    this.function
  }) ;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: platform
                          ? Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.grey.shade200,
                            )
                          : Image.network('$image'),
                    
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      time,
                      hasUnreadMessage
                          ? Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  )),
                              child: Center(
                                  child: Text(
                                newMesssageCount.toString(),
                                style: TextStyle(color: Colors.white,fontSize: 11),
                              )),
                            )
                          : SizedBox()
                    ],
                  ),
                  onTap: this.function
                ),
              ),
            ],
          ),
          Divider(
            endIndent: 12.0,
            indent: 12.0,
            height: 0,
          ),
        ],
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {},
        ),
      ],
    );
  }
}
