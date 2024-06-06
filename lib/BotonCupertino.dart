import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino and material'),
      ),
      body: Center(
        child: CupertinoButton(
          child: Text('Go to Cupertino page'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => CupertinoScreen()),
            );
          },
        ),
      ),
    );
  }
}

class CupertinoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Screen'),
        previousPageTitle: 'Back',
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              child: Text('Show Material Alert'),
              onPressed: () {
                _showMaterialAlert(context);
              },
            ),
            CupertinoButton(
              child: Text('Show Material Alert with Options'),
              onPressed: () {
                _showMaterialAlertWithOptions(context);
              },
            ),
            CupertinoButton(
              child: Text('Show Cupertino Alert'),
              onPressed: () {
                _showCupertinoAlert(context);
              },
            ),
            CupertinoButton(
              child: Text('Show Cupertino Alert with Options'),
              onPressed: () {
                _showCupertinoAlertWithOptions(
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showCupertinoAlert(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Alert'),
          content: Text('This is a simple Cupertino Alert'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

void _showCupertinoAlertWithOptions(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Cupertino Alert with Options'),
        content: Text('This is a Cupertino alert with options.'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _showMaterialAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Simple Material Alert'),
        content: Text('This is a simple material alert.'),
      );
    },
  );
}

void _showMaterialAlertWithOptions(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Material Alert with options'),
            content: Text('This is a material alert with options'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]);
      });
}
