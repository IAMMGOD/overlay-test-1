import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator App',
      home: TranslationOverlayExample(),
    );
  }
}

class TranslationOverlayExample extends StatefulWidget {
  @override
  _TranslationOverlayExampleState createState() => _TranslationOverlayExampleState();
}

class _TranslationOverlayExampleState extends State<TranslationOverlayExample> {
  OverlayEntry? entry;
  Offset offset = Offset(20, 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator App'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
              showOverlay();
            }, child: Text('click'),
          ),
            ElevatedButton(
            onPressed: (){
              hideOverlay();
            }, child: Text('remove'),
          ),
          ]
        ),
      ),
    );
  }

  void showOverlay() {
    entry = OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details){
              offset += details.delta;

              entry!.markNeedsBuild();
            },
            child: ElevatedButton.icon(
              icon: Icon(Icons.stop_circle_rounded),
                label: Text('record'),
                onPressed: (){},

                ),
          ),
        )
    );

    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }
  }


