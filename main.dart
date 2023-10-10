import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool scaledUI = false;

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: AppBar(title: Text(scaledUI ? 'Scaled UI' : 'Resized UI')),
      backgroundColor: Colors.green[200],
      body: AlertDialog(
        title: const Text('Title'),
        content: const Text('Content'),
        actions: [TextButton(child: const Text('Save'), onPressed: () {})],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          scaledUI = !scaledUI;
        }),
        child: Icon(scaledUI ? Icons.zoom_out : Icons.zoom_in),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: scaledUI ? 'Scaled UI' : 'Resized UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: scaledUI
          ? ResponsiveWrapper.builder(
              scaffold,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
              ],
            )
          : scaffold,
    );
  }
}
