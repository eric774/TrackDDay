import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minor_project_1/auth.dart';
import 'package:minor_project_1/wrapper.dart';
// import 'screens/allTasks.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:provider/provider.dart';
import 'package:minor_project_1/models/task_data.dart';
import 'package:splashscreen/splashscreen.dart';

// include flutter slidable package for slidable actions like archive delete etc.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<String>.value(
      value: AuthService().user,
      initialData: 'null',
      child: ChangeNotifierProvider(
        create: (context) => TaskData(),
        child: AdaptiveTheme(
          light: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            accentColor: Colors.amber,
          ),
          dark: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            accentColor: Colors.amber,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
              theme: theme,
              darkTheme: darkTheme,
              // home: AllTasksScreen(),
              home: SplashScreen(
                  seconds: 2,
                  // navigateAfterSeconds: new AllTasksScreen(),
                  navigateAfterSeconds: Wrapper(),
                  title: new Text(
                    'Welcome to your Track',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  // image: new Image.network('Free_Sample_By_Wix'),
                  image: Image(
                    image: AssetImage('images/Free_Sample_By_Wix.png'),
                  ),
                  backgroundColor: Colors.white,
                  styleTextUnderTheLoader: new TextStyle(),
                  photoSize: 100.0,
                  onClick: () => print("Flutter Egypt"),
                  loaderColor: Colors.red)),
        ),
      ),
    );
  }
}
