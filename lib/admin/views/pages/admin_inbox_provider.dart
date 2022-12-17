import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/admin/views/pages/admin_message_list.dart';
import 'package:puvoms/models/message_model.dart';
import 'package:puvoms/models/user_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/constants/material_constant.dart';

class AdminInboxProvider extends StatefulWidget {
  const AdminInboxProvider({Key? key}) : super(key: key);

  @override
  State<AdminInboxProvider> createState() => _AdminInboxProviderState();
}

class _AdminInboxProviderState extends State<AdminInboxProvider> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _controller = new TextEditingController();
  
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String message = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObject?>(context);
    // TODO: implement build

    return StreamProvider<List<MessageList>>.value(
        value: DatabaseService().messageList,
        initialData: const [],
        builder: (context, snapshot) {
          return StreamBuilder<UserData>(
              stream: DatabaseService(uid: user!.uid).userData,
              builder: (context, snapshot) {
                UserData? userData = snapshot.data;
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      context.mainWP, context.mainHP, context.mainWP, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 9,
                        child: AdminMessageList(scrollController: scrollController,),
                      ),
                      Expanded(
                          flex: 1,
                          child: Form(
                            key: _formKey,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: TextFormField(
                                    controller: _controller,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black87),
                                    decoration: const InputDecoration(
                                      hintText: "Aa",
                                    ),
                                    onChanged: (value) => setState(() {
                                      message = value;
                                      debugPrint(value);
                                    }),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Message shouldn't be Empty");
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      try {
                                        if (_formKey.currentState!.validate()) {
                                          await DatabaseService(uid: user.uid)
                                              .createMessage(
                                                  user.uid!,
                                                  "${userData!.firstName} ${userData.lastName}",
                                                  userData.role!,
                                                  message,
                                                  DateTime.now());
                                          _controller.clear();
                                          scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                                        } else {
                                          scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                                        }
                                      } catch (e) {
                                        debugPrint(
                                            "Something went wrong with sending your message");
                                        scrollController.animateTo(scrollController.position.minScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                                      }
                                    },
                                    icon: const Icon(Icons.send_rounded))
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              });
        });
  }
}
