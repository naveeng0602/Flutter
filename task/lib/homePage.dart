import 'package:flutter/material.dart';
import 'package:task/local/db_helper.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homepage')),
      body:
          allNotes.isNotEmpty
              ? ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text(
                      "${index+1}",
                    ),
                    title: Text(
                      "${allNotes[index][DBHelper.TABLE_NOTE_TITLE]}",
                    ),
                    subtitle: Text(
                      "${allNotes[index][DBHelper.TABLE_NOTE_DESC]}",
                    ),
                    trailing: SizedBox(
                      width: 80,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              bool check = await dbRef!.deleteNote(
                                sno: allNotes[index][DBHelper.TABLE_NOTE_SNO],
                              );
                              if (check) {
                                getNotes();
                              }
                            },
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
              : Center(child: Text("No Notes yet!!")),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String errorMsg = "";
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(11),
                child: Column(
                  children: [
                    Text("Add Notes"),
                    SizedBox(height: 21),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter Title",
                        label: Text("Title *"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: descController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Enter Description",
                        label: Text("Desc *"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () async {
                              var title = titleController.text;
                              var desc = descController.text;
                              if (title.isNotEmpty && desc.isNotEmpty) {
                                bool check = await dbRef!.addNote(
                                  mTitle: title,
                                  mDesc: desc,
                                );
                                if (check) {
                                  getNotes();
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("please fill field")),
                                );
                              }
                              titleController.clear();
                              descController.clear();
                              Navigator.pop(context);
                            },
                            child: Text("Add Notes"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ),
                        Text(errorMsg),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
