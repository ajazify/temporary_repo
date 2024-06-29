import 'package:flutter/material.dart';
import 'package:instagram_clone/features/storage/sharedPref.dart';

class LocalStorage extends StatefulWidget {
  LocalStorage({super.key});

  @override
  _LocalStorageState createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  final SharedPrefNote sharedPrefNote = SharedPrefNote();
  TextEditingController controller = TextEditingController();
  late Future<List<String>> _notesFuture;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  void _refreshNotes() {
    setState(() {
      _notesFuture = sharedPrefNote.getValues(key: KeyConst.NOTEKEY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // assign true
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<String>>(
                future: _notesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No notes available'));
                  } else {
                    List<String> notes = snapshot.data!;
                    notes = notes.reversed.toList();
                    return ListView.separated(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.75,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.1),
                                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    notes[index],
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    textAlign: TextAlign.right,
                                    'Note',
                                    style: TextStyle(color: Colors.white10),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(
                        height: 3,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIconColor: Colors.white,
                      prefixIcon: const Icon(Icons.edit_note),
                      fillColor: Colors.white.withOpacity(.2),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (controller.text.isNotEmpty) {
                      await sharedPrefNote.store(key: KeyConst.NOTEKEY, v: controller.text);
                      controller.clear();
                      _refreshNotes();
                    }
                  },
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class KeyConst {
  static const NOTEKEY = 'noteKey';
}
 