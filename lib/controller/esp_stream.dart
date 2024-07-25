import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('http://192.168.1.12/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('http://192.168.1.12/:81/stream'));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Expanded (child: WebViewWidget(controller: controller)),
          ],
        );
      
    
  }
}
