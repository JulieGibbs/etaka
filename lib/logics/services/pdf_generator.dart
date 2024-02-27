import 'package:etaka/logics/models/transaction.dart';
import 'package:etaka/views/components/toast.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:printing/printing.dart';

class PdfGenerator {
  static Future<void> generateTransactionHistoryPDF(
      List<Transaction> list) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Header(
                level: 0,
                child: pw.Text("Transaction History",
                    textScaleFactor: 2, style: pw.TextStyle(font: font)),
              ),
              // ignore: deprecated_member_use
              pw.Table.fromTextArray(
                context: context,
                cellStyle: pw.TextStyle(font: font),
                headerDecoration: pw.BoxDecoration(
                  // borderRadius: 2,
                  color: PdfColors.grey300,
                ),
                headerStyle: pw.TextStyle(
                  font: font,
                  color: PdfColors.black,
                  fontWeight: pw.FontWeight.bold,
                ),
                data: <List<String>>[
                  <String>[
                    'Transaction ID',
                    'Transaction Type',
                    'Amount',
                    'Date & Time',
                    'User'
                  ],
                  ...list.map((e) => [
                        e.transId,
                        e.transType,
                        e.amount.toString(),
                        e.datetime.toString(),
                        e.user.toString()
                      ])
                ],
              ),
            ],
          );
        })); // Page

    final String dir = "/storage/emulated/0/Download/";
    final String path = '$dir/transaction_history.pdf';
    print(
        path); // /data/user/0/com.example.etaka/app_flutter/transaction_history.pdf
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    success_toast("PDF Downloaded Successfully at $path");
  }
}
