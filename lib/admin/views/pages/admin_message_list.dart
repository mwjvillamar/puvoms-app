import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/admin/views/pages/admin_message_tile.dart';
import 'package:puvoms/models/message_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/services/database.dart';

class AdminMessageList extends StatefulWidget {
  
  final ScrollController scrollController;
  
  const AdminMessageList({ Key? key,
      required this.scrollController,
      })
      : super(key: key);

  @override
  State<AdminMessageList> createState() => _AdminMessageListState();
}

class _AdminMessageListState extends State<AdminMessageList> {
  
  
  @override
  Widget build(BuildContext context) {

    final messages = Provider.of<List<MessageList>>(context);
    
    return StreamBuilder<UserObject?>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        UserObject? user = snapshot.data;
        return ListView.builder(
          reverse: true,
          controller: widget.scrollController,
          itemCount: messages.length,
          itemBuilder: (context, index){
            return MessageTile(
              message: messages[index].message,
              sender: messages[index].senderName,
              role: messages[index].senderRole,
              sentByMe: messages[index].senderUID == user!.uid,
              sentByAdmin: messages[index].senderRole == "Admin",
            );    
          }
        );
      }
    );
    
  }
}