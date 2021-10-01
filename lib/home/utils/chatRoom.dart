import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app_ui/Auth/authenticator.dart';

Future<void> generateChatRoomId(String userId)async{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var chatRoomId = '${userData["userId"]},$userId';
  dynamic clientData = await firestore.collection('users').doc(userId).get();
  clientData = clientData.data();
  await firestore.collection('users').doc(userId).set({
    ...clientData as Map,
    'chats': [...clientData['chats'],{
      ...userData as Map,
      'chatRoomId':chatRoomId
    }]
  });
  await firestore.collection('users').doc(userData['userId']).set({
    ...userData as Map,
    'chats':[...userData['chats'],{...clientData , 'chatRoomId':chatRoomId}]
  });  
  await firestore.collection('chatRoom').doc(chatRoomId).set({
    "chatRoomId":chatRoomId,
    'userOneId': userId,
    "userTwoId": userData['userId']
  });
  dynamic myUserData = firestore.collection('users').doc(userData['userid']);
  userData = myUserData.data();

}
