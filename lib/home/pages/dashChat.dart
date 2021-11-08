import 'dart:io';
import 'package:chat_app_ui/home/home.dart';
import 'package:chat_app_ui/home/widgets/loader.dart';
import 'package:path/path.dart' as path;

import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dash_chat/dash_chat.dart';

dynamic myChatter;
dynamic myChatRoomId;

// ignore: must_be_immutable
class MyDashChat extends StatefulWidget {
  dynamic chatRoomId;
  dynamic chatterId;
  dynamic chatterName;

  MyDashChat(dynamic chatRoomId, dynamic chatterId, dynamic chatterName) {
    this.chatterId = chatterId;
    this.chatRoomId = chatRoomId;
    myChatter = {'name': chatterName, 'id': chatterId};
    myChatRoomId = chatRoomId;
  }
  @override
  _MyDashChatState createState() => _MyDashChatState();
}

class _MyDashChatState extends State<MyDashChat> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "${userData['name']}",
    uid: "${userData['userId']}",
    avatar: "${userData['profilePic']}",
  );

  final ChatUser otherUser = ChatUser(
    name: "${myChatter['name']}",
    uid: "${myChatter['id']}",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void onSend(ChatMessage message) {
    Map<String, dynamic> myMessage = message.toJson();
    if (myMessage['image'] == '') {
      myMessage.remove('image');
    }
    print(myMessage);

    FirebaseFirestore.instance
        .collection('chatRoom')
        .doc(myChatRoomId)
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(myMessage);
    setState(() {
      messages = [...messages, message];
      print(messages.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('${ChatUser().avatar}'),
              backgroundColor: Theme.of(context).primaryColor,
              child: platform
                  ? Text(
                      '${ChatUser().name?.split('')[0].toUpperCase()}',
                      style: TextStyle(color: Colors.white),
                    )
                  : Image.network('${ChatUser().avatar}'),
            ),
            SizedBox(width: 20),
            Text(
              "${myChatter['name']}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 16,
            ),
            child: Icon(Icons.settings),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chatRoom')
              .doc(myChatRoomId)
              .collection('messages')
              .orderBy("createdAt")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: MyLoader(),
              );
            } else {
              List<DocumentSnapshot> items = snapshot.data!.docs;
              var messages = items
                  .map((i) => ChatMessage.fromJson(i.data() as Map))
                  .toList();
              return DashChat(
                onSend: onSend,
                avatarMaxSize: 60,
                textCapitalization: TextCapitalization.characters,
                key: _chatViewKey,
                inverted: false,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: user,
                quickReplyBuilder: (reply) {
                  print(reply);
                  return Text('data');
                },
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: true,
                avatarBuilder: (c) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage('${c.avatar}'),
                    backgroundColor: Theme.of(context).primaryColor,
                    child: platform
                        ? Text(
                            '${c.name?.split('')[0].toUpperCase()}',
                            style: TextStyle(color: Colors.white),
                          )
                        : Image.network('${c.avatar}'),
                  );
                },
                showAvatarForEveryMessage: false,
                scrollToBottom: true,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                showTraillingBeforeSend: true,
                shouldShowLoadEarlier: false,
                trailing: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () async {
                      final picker = ImagePicker();
                      XFile? result = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                        maxHeight: 400,
                        maxWidth: 400,
                      );

                      if (result != null) {
                        var imageName = path.basename(result.path);
                        final Reference storageRef =
                            FirebaseStorage.instance.ref('$imageName');

                        final taskSnapshot = await storageRef.putFile(
                          File(result.path),
                        );

                        String url = await taskSnapshot.ref.getDownloadURL();

                        ChatMessage message =
                            ChatMessage(text: "", user: user, image: url);

                        FirebaseFirestore.instance
                            .collection('chatRoom')
                            .doc(myChatRoomId)
                            .collection('messages')
                            .add(message.toJson());
                      }
                    },
                  )
                ],
              );
            }
          }),
    );
  }
}
