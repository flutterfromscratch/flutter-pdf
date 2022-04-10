import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makepdfs/models/invoice.dart';
import 'package:makepdfs/pages/detail.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({Key? key}) : super(key: key);

  final invoices = <Invoice>[
    Invoice(
        customer: 'David Thomas',
        address: '123 Fake St\r\nBermuda Triangle',
        items: [
          LineItem(
            'Technical Engagement',
            120,
          ),
          LineItem('Deployment Assistance', 200),
          LineItem('Develop Software Solution', 3020.45),
          LineItem('Produce Documentation', 840.50),
        ],
        name: 'Create and deploy software package'),
    Invoice(
      customer: 'Michael Ambiguous',
      address: '82 Unsure St\r\nBaggle Palace',
      items: [
        LineItem('Professional Advice', 100),
        LineItem('Lunch Bill', 43.55),
        LineItem('Remote Assistance', 50),
      ],
      name: 'Provide remote support after lunch',
    ),
    Invoice(
      customer: 'Marty McDanceFace',
      address: '55 Dancing Parade\r\nDance Place',
      items: [
        LineItem('Program the robots', 400.50),
        LineItem('Find tasteful dance moves for the robots', 80.55),
        LineItem('General quality assurance', 80),
      ],
      name: 'Create software to teach robots how to dance',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoices'),
      ),
      body: ListView(
        children: [
          ...invoices.map(
            (e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.customer),
              trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DetailPage(invoice: e),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
