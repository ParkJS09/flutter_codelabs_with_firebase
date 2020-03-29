import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static const routes = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FlutterKakaoLogin kakaoSignIn = FlutterKakaoLogin();

  @override
  void initState() {
    super.initState();
    //_initKakaoTalkInstalled();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('가입 테스트_구글'),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
            FlatButton(
              child: Text("구글 가입 TEST"),
              onPressed: () {
                //해당 메소드만 비동기 처리를 위해 then처
                _handleSignIn().then((user) {
                  print(user);
                }).catchError((error) => (print("ERROR : $error")));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            ),
            FlatButton(
              child: Text("카카오 가입 TEST"),
              onPressed: () {
                //해당 메소드만 비동기 처리를 위해 then처
                //_kakaoLogin();
              },
            )
          ],
        ),
      ),
    );
  }

  //비동기인 로그인 요청을 기다려야 하기에 async, await적용, 리턴 값은 FirebaseUSer
  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

//  /**
//   * 카카오톡 설치 확인
//   */
//  _initKakaoTalkInstalled() async {
//    final installed = await isKakaoTalkInstalled();
//    print('kakao install : ' + installed.toString());
//    setState(() {
//      _isKakaoTalkInstalled = installed;
//    });
//  }
//
//  void loginWithKakao() async {
//    try {
//      var code = await AuthCodeClient.instance.request();
//      _issueAccessToken(code);
//    } catch (e) {
//      print(e);
//    }
//  }
//
//  void _issueAccessToken(String authCode) async {
//    try {
//      var token = await AuthApi.instance.issueAccessToken(authCode);
//      AccessTokenStore.instance.toStore(token);
//      print(token);
//    } catch (e) {
//      print('Error access token : $e');
//    }
//  }
//
//
//  void loginWithTalk() async {
//    try {
//      var code = await AuthCodeClient.instance.requestWithTalk();
//      _issueAccessToken(code);
//    } catch (e) {
//      print(e);
//    }
//  }



//  _kakaoLogin() async{
//    FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
//    final KakaoLoginResult result = await kakaoSignIn.logIn();
//    switch (result.status) {
//      case KakaoLoginStatus.loggedIn:
//        _updateMessage('LoggedIn by the user.\n'
//            '- UserID is ${result.account.userID}\n'
//            '- UserEmail is ${result.account.userEmail} ');
//        break;
//      case KakaoLoginStatus.loggedOut:
//        _updateMessage('LoggedOut by the user.');
//        break;
//      case KakaoLoginStatus.error:
//        _updateMessage('This is Kakao error message : ${result.errorMessage}');
//        break;
//    }
//  }

  void _updateMessage(String s) {
    print(s);
  }

}