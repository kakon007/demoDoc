import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class VideoConfigScreen extends StatefulWidget {
  const VideoConfigScreen({Key key}) : super(key: key);

  @override
  _VideoConfigScreenState createState() => _VideoConfigScreenState();
}

class _VideoConfigScreenState extends State<VideoConfigScreen> {
  TextEditingController apiKeyController = TextEditingController();
  TextEditingController apiSecretController = TextEditingController();
  TextEditingController clientIdController = TextEditingController();
  TextEditingController clientIdSEController = TextEditingController();
  TextEditingController clientSecretController = TextEditingController();
  TextEditingController appCodeController = TextEditingController();
  TextEditingController accessTokenController = TextEditingController();
  TextEditingController refreshTokenController = TextEditingController();
  TextEditingController zoomUserIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    var apiKey = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Api Key',
      minimizeBottomPadding: true,
      controller: apiKeyController,
    );
    var apiSecret = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Api Secret',
      minimizeBottomPadding: true,
      controller: apiSecretController,
    );
    var clientId = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Client ID',
      minimizeBottomPadding: true,
      controller: clientIdController,
    );
    var clientIdSE = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Client Id SE',
      minimizeBottomPadding: true,
      controller: clientIdController,
      maxLines: 3,
    );
    var clientSecret = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Client Secret',
      minimizeBottomPadding: true,
      controller: clientSecretController,
    );
    var appCode = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'App Code',
      minimizeBottomPadding: true,
      controller: clientSecretController,
    );
    var accessToken = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Access Token',
      minimizeBottomPadding: true,
      controller: accessTokenController,
    );
    var refreshToken = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Refresh Token',
      minimizeBottomPadding: true,
      controller: refreshTokenController,
      maxLines: 3,
    );
    var zoomUserId = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Zoom user ID',
      minimizeBottomPadding: true,
      controller: zoomUserIdController,
    );
    var userName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'User Name',
      minimizeBottomPadding: true,
      controller: userNameController,
    );
    var userEmail = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'User Email',
      minimizeBottomPadding: true,
      controller: zoomUserIdController,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Configuration"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              apiKey,
              apiSecret,
              clientId,
              clientIdSE,
              clientSecret,
              appCode,
              accessToken,
              refreshToken,
              zoomUserId,
              userName,
              userEmail,
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * .35,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xffFF6161),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Cancel"),
                    ),
                  ),
                  Container(
                    width: width * .35,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppTheme.buttonActiveColor),
                      ),
                      onPressed: () {},
                      child: Text("Save"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
