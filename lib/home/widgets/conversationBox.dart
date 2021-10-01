import 'package:chat_app_ui/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConversationBox extends StatelessWidget {
  final txt;
  final caption;
  final dp;
  final func;
  ConversationBox({this.dp, this.caption, this.txt,this.func});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: func,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[50],
                    backgroundImage: NetworkImage('$dp'),
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
              
                Icon(
                  Icons.arrow_forward,
                  color: Colors.grey[600],
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
