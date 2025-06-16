import 'dart:io';

import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactPage extends StatefulWidget {

  final Contact? contact;

  const ContactPage({super.key, this.contact});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name.isNotEmpty ? _editedContact.name : "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.save,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                    _editedContact.img != null
                        ? FileImage(File(_editedContact.img))
                        : AssetImage("images/profile.png"),
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text){

              },
            )
          ],
        ),
      ),
    );
  }
}
