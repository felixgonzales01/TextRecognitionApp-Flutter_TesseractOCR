import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:open_file/open_file.dart';

class ResultScreen extends StatefulWidget {
  final String extractedText;

  const ResultScreen({Key? key, required this.extractedText}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Extracted Text'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SelectableText(
          widget.extractedText,
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pdf = pdfWidgets.Document();
          pdf.addPage(
            pdfWidgets.Page(
              build: (context) => pdfWidgets.Center(
                child: pdfWidgets.Text(widget.extractedText),
              ),
            ),
          );
          final directory = await getExternalStorageDirectory();
          final filePath = '${directory!.path}/extracted_text.pdf';
          final file = File(filePath);
          await file.writeAsBytes(await pdf.save());

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Text exported as PDF'),
              action: SnackBarAction(
                label: 'Open PDF',
                onPressed: () {
                  openFile(filePath);
                },
              ),
            ),
          );
        },
        child: Icon(Icons.picture_as_pdf),
        backgroundColor: Colors.grey[900],
        heroTag: null,
      ),
    );
  }

  Future<void> openFile(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      try {
        await OpenFile.open(filePath);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening file: $e'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File not found.'),
        ),
      );
    }
  }
}
