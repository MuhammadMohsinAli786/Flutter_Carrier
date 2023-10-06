import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class FirstScreen extends StatefulWidget {
  static const String routeName = '/first-screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int selectedPdfIndex = -1;

  final List<String> pdfFiles = [
    'assets/pdf/a.pdf',
    // 'assets/pdf/file2.pdf',
    // Add more PDF file paths here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: pdfFiles.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedPdfIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selectedPdfIndex == index
                    ? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'File ${index + 1}',
                  style: TextStyle(
                    color: selectedPdfIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedPdfIndex != -1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PDFReaderScreen(
                  path: pdfFiles[selectedPdfIndex],
                ),
              ),
            );
          }
        },
        child: Icon(Icons.open_in_new),
      ),
    );
  }
}

class PDFReaderScreen extends StatefulWidget {
  final String path;

  PDFReaderScreen({required this.path});

  @override
  _PDFReaderScreenState createState() => _PDFReaderScreenState();
}

class _PDFReaderScreenState extends State<PDFReaderScreen> {
  late int totalPages;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    countTotalPages();
  }

  Future<void> countTotalPages() async {
    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/temp.pdf';
    final tempFile = File(tempDocumentPath);

    await tempFile.writeAsBytes(
      (await rootBundle.load(widget.path)).buffer.asUint8List(),
      flush: true,
    );

     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Reader'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PDFView(
              filePath: widget.path,
              onPageChanged: (page, total) {
                setState(() {
                  currentPage = page!;
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Page ${currentPage + 1} of $totalPages',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        FirstScreen.routeName: (ctx) => FirstScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FirstScreen.routeName);
              },
              child: Text('First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
