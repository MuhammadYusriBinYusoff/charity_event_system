import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:charity_event_system/pages/widgets/custom_app_bar.dart';
import 'package:charity_event_system/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewTransactionPage extends StatefulWidget {
  @override
  _ViewTransactionPageState createState() => _ViewTransactionPageState();
}

class _ViewTransactionPageState extends State<ViewTransactionPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  void showPDFDialog(String url) async {
    PDFDocument document;
    try {
      document = await PDFDocument.fromURL(url);
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: PDFViewer(
              document: document,
              showIndicator: true,
              showPicker: false,
            ),
          ),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    EventTransactionProvider eventTransactionFile =
        Provider.of<EventTransactionProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Transaction History",
      ),
      body: eventTransactionFile.transactionDetailsList.isEmpty
          ? const Center(child: Text('No transactions found', style: TextStyle(fontSize: 16),))
          : ListView.builder(
              itemCount: eventTransactionFile.transactionDetailsList.length,
              itemBuilder: (context, index) {
                final transaction =
                    eventTransactionFile.transactionDetailsList[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.picture_as_pdf),
                    title: Text(transaction.pdfName ?? 'No Name'),
                    subtitle:
                        Text("donated by: ${transaction.donatorName}" ?? ""),
                    onTap: () async {
                      String? url = transaction.pdfUrls;
                      if (url != null) {
                        showPDFDialog(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No PDF URL found')),
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
