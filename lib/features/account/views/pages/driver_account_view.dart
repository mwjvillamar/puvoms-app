import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/features/queue/models/user_model.dart';
import 'package:puvoms/features/queue/models/vehicle_model.dart';
import 'package:puvoms/services/auth.dart';
import 'package:puvoms/services/database.dart';
import 'package:puvoms/features/account/views/widgets/account_button_widget.dart';
import 'package:puvoms/features/account/views/widgets/account_label_widget.dart';
import 'package:puvoms/constants/material_constant.dart';
import 'package:puvoms/features/account/views/widgets/account_infoitem_widget.dart';

class DriverAccountView extends StatefulWidget {

  const DriverAccountView({Key? key}) : super(key: key);

  @override
  State<DriverAccountView> createState() => _DriverAccountViewState();
}

class _DriverAccountViewState extends State<DriverAccountView> {

  //Firebase Instance
  final AuthService _auth = AuthService();

  //formkey
  final _formKey = GlobalKey<FormState>();

  final double fontSize = 12;
  
  //account edits with vehicle edits
  String firstName = "";
  String lastName = "";
  String phoneNum = "";
    
  String vehicleBrand = "";
  String vehicleColor = "";
  String plateNumber = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<UserObject?>(context);
    
    // TODO: implement build

     return StreamBuilder<UserData>(
       stream: DatabaseService(uid: user!.uid).userData,
       builder: (context, snapshot) {
        UserData? userData = snapshot.data;
        return StreamBuilder<VehicleData>(
          stream: DatabaseService(uid: user.uid).vehicleData,
          builder: (context, snapshot2) {
            VehicleData? vehicleData = snapshot2.data;
            return Center(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(context.mainWP, context.mainHP, context.mainWP, context.mainHP),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 200,
                                  minWidth: 200,
                                ),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('lib/assets/user_placeholder_image.png'),
                                    fit: BoxFit.contain
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: context.secondaryHP),
                            Center(
                                child: Text(
                                  "Hey ${userData?.firstName}!",
                                  style: const TextStyle(fontSize: 24)
                                )
                            ),
                            Center(
                              child: Text(
                                "You are a ${userData?.role}",
                                style: const TextStyle(fontSize: 20)
                              )
                            ),
                            Center(
                              child: Text("${userData?.email}",
                                style: const TextStyle(fontSize: 16)
                              )
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AccountLabel(icon: Icons.person, text: 'Full Name:'),
                                AccountInfoItem(
                                  key: const ValueKey("account-name"),
                                  value: "${userData?.firstName} ${userData?.lastName}",
                                  callbackFunction: (val){
                                    setState(() {
                                      firstName = val.first;
                                      lastName = val.last;
                                    });
                                  },
                                ),
                                const AccountLabel(icon: Icons.phone, text: 'Phone:'),
                                AccountInfoItem(
                                  key: const ValueKey("account-phoneNum"),
                                  value: userData?.phoneNum,
                                  callbackFunction: (val) {
                                    setState(() {
                                      phoneNum = val;
                                      debugPrint(phoneNum);
                                    });
                                  },
                                ),
                                // CustomTextFormField(
                                //   key: const ValueKey("account-phoneNum"),
                                //   isHidden: false,
                                //   hint: "${userData?.lastName}",
                                //   icon: Icons.abc,
                                //   callbackFunction: (val) => setState(() => phoneNum = val),
                                // ),
                                const AccountLabel(icon: Icons.directions_bus, text: 'Vehicle Brand:'),
                                AccountInfoItem(
                                  key: const ValueKey("account-vehicleBrand"),
                                  value: vehicleData?.vehicleBrand,
                                  callbackFunction: (val) => setState(() => vehicleBrand = val),
                                ),
                                const AccountLabel(icon: Icons.directions_bus, text: 'Vehicle Color:'),
                                AccountInfoItem(
                                  key: const ValueKey("account-vehicleColor"),
                                  value: vehicleData?.vehicleColor,
                                  callbackFunction: (val) => setState(() => vehicleColor = val),
                                ),
                                const AccountLabel(icon: Icons.abc, text: 'Vehicle Plate Number:'),
                                AccountInfoItem(
                                  key: const ValueKey("account-plateNumber"),
                                  value: vehicleData?.plateNumber,
                                  callbackFunction: (val) => setState(() => plateNumber = val),
                                ),
                              ],
                            ),
                            SizedBox(height: context.secondaryHP),
                            AccountButton(
                              text: "Save",
                              key: const ValueKey("driver-account-save"),
                              value: {
                                "uid" : user.uid,
                                "firstName" : firstName,
                                "lastName" : lastName,
                                "phoneNum" : phoneNum,
                                "vehicleBrand" : vehicleBrand,
                                "vehicleColor" : vehicleColor,
                                "plateNumber" : plateNumber
                              },
                              // value: [user.uid, firstName, lastName, phoneNum, vehicleBrand, vehicleColor, plateNumber],
                              formState: _formKey.currentState,
                            ),
                            AccountButton(text: "Logout", key: const ValueKey("signout"), value: user.uid)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
             );
          }
        );
       }
     );
  }
}
