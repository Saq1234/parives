import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PfdPage extends StatefulWidget {
  String? filepath;

  PfdPage({this.filepath});

  @override
  State<PfdPage> createState() => _PfdViewState();
}

class _PfdViewState extends State<PfdPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("pp---${widget.filepath}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.filepath!.isNotEmpty
            ? SfPdfViewer.network(
          widget.filepath.toString(),
        )
            : Center(
          child: Text("No Data"),
        ),
      ),
    );
  }
}