import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/widgets/termCard.dart';

class Term extends StatefulWidget {
  const Term({this.data});
  final QueryDocumentSnapshot<Object?>? data;

  @override
  _TermState createState() => _TermState();
}

class _TermState extends State<Term> {
  final _formKey = GlobalKey<FormState>();
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TermCard(
                termImage: widget.data!.get('termImage'),
                termName: widget.data!.get('termTitle'),
                termAuthor: widget.data!.get('termAuthor')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Akla gelen ilk anlamı",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17)),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isEditable = !isEditable;
                              });
                            },
                            child: Text("Katkı sağla"),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: Text(
                        widget.data!.get('termMean'),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Örnek",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: Text(
                        widget.data!.get('termExample'),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Ek açıklamalar",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == false,
                      child: Text(
                        widget.data!.get('termDescription'),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Düzenlemek için dokunun',
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isEditable == true,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContributeSuccess()));
                            },
                            child: Text("Tamamla"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isEditable =! isEditable;
                              });
                            },
                            child: Text("İptal et"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Katkı sağlayanlar",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    Text(
                      widget.data!.get('termContributor'),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 17),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ContributeSuccess extends StatelessWidget {
  const ContributeSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://www.upload.ee/image/13825020/Mask_Group.png", height: 48,),
            SizedBox(height: 16),
            Text("Tebrikler!", style: TextStyle(color: Colors.green, fontSize: 22),),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Düzenlemeleriniz kaydedilerek moderatör onayına gönderilmiştir. Katkınız için Lugat topluluğu adına teşekkür ederiz.", style: TextStyle(color: Colors.green), textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}

