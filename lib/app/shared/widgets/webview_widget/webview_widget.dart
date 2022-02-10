import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewWidget extends StatefulWidget {
  final String url;
  const WebviewWidget({Key? key, required this.url}) : super(key: key);

  @override
  _WebviewWidgetState createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse(widget.url)),
      ),
    );
  }
}
