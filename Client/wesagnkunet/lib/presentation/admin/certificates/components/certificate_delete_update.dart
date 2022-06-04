import 'package:flutter/material.dart';

class CertificateDeleteUpdateWidget extends StatelessWidget {
  CertificateDeleteUpdateWidget({
    required this.Certificate,
  });
  // TODO get particular marriage certificate
  String Certificate;
  static const TextStyle CustomeTestStyel = TextStyle(
    color: Colors.black87,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: 500,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white,

                borderRadius: BorderRadius.circular(10),
              ),
              width: 500,
              height: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Certificate Owner", style: CustomeTestStyel,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Issued Date', style: CustomeTestStyel,),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Status",
                        style: CustomeTestStyel
                      ),
                    ),
                  ]),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      child: Text("Approve Certificate"),
                      onPressed: () {
                        // TODO approve functionality
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      child: Text("Reject Certificate"),
                      onPressed: () {
                        // TODO reject functionality
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      child: Text("Update Certificate"),
                      onPressed: () {
                        // TODO update functionality
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      child: Text("Delete  Certificate"),
                      onPressed: () {
                        // TODO delete functionality
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
