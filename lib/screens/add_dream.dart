import 'package:dream_diary/data/dream_types.dart';
import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/utils.dart';
import 'package:flutter/material.dart';

class AddDreamScreen extends StatefulWidget {
  const AddDreamScreen({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  State<AddDreamScreen> createState() => _AddDreamScreenState();
}

class _AddDreamScreenState extends State<AddDreamScreen> {
  final _formKey = GlobalKey<FormState>(); // Create key to handle form

  var _enteredTitle = '';
  var _enteredDescription = '';
  var _selectedDreamType = dreamTypes[DreamTypes.lucid]!;

  // Save a new dream
  void _saveDream() {
    // Only save when formfields are validated without error
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newDream = Dream(
          title: _enteredTitle,
          description: _enteredDescription,
          date: widget.selectedDate,
          dreamType: _selectedDreamType);

      // Close add screen
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: kBackgroundGradient),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Dream'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),

            // Input form
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Date
                  Row(
                    children: [
                      Text('Date: ${widget.selectedDate}'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title
                  TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.trim().length <= 1) {
                        return 'Title must between 1 and 50 characters.';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _enteredTitle = newValue!,
                  ),
                  const SizedBox(height: 10),

                  // Description
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      alignLabelWithHint: true,
                    ),
                    maxLength: 5000,
                    maxLines: null,
                    minLines: 10,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.trim().length <= 1) {
                        return 'Entry must have a description.';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _enteredDescription = newValue!,
                  ),
                  const SizedBox(height: 10),

                  // Radio buttons
                  Column(
                    children: [
                      RadioListTile(
                        title: Text(dreamTypes[DreamTypes.lucid]!.title),
                        tileColor: Colors.transparent,
                        value: dreamTypes[DreamTypes.lucid],
                        groupValue: _selectedDreamType,
                        onChanged: (value) {
                          setState(() {
                            _selectedDreamType = value!;
                            print(_selectedDreamType.title);
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(dreamTypes[DreamTypes.halfLucid]!.title),
                        tileColor: Colors.transparent,
                        value: dreamTypes[DreamTypes.halfLucid],
                        groupValue: _selectedDreamType,
                        onChanged: (value) {
                          setState(() {
                            _selectedDreamType = value!;
                            print(_selectedDreamType.title);
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(dreamTypes[DreamTypes.nonLucid]!.title),
                        tileColor: Colors.transparent,
                        value: dreamTypes[DreamTypes.nonLucid],
                        groupValue: _selectedDreamType,
                        onChanged: (value) {
                          setState(() {
                            _selectedDreamType = value!;
                            print(_selectedDreamType.title);
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Submit button
                  ElevatedButton.icon(
                    onPressed: _saveDream,
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
