import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/inbox/views/pages/admin_inbox_provider.dart';
import 'package:puvoms/features/inbox/views/pages/admin_message_list.dart';
import 'package:puvoms/features/inbox/models/message_model.dart';
import 'package:puvoms/features/queue/models/user_model.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/constants/material_constant.dart';

class AdminInboxView extends StatefulWidget {
  const AdminInboxView({Key? key}) : super(key: key);

  @override
  State<AdminInboxView> createState() => _AdminInboxViewState();
}

class _AdminInboxViewState extends State<AdminInboxView> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String message = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const AdminInboxProvider();
  }
}
