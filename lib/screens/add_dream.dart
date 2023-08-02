import 'package:dream_diary/data/dream_types.dart';
import 'package:dream_diary/models/dream.dart';
import 'package:dream_diary/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

class AddDreamScreen extends StatefulWidget {
  const AddDreamScreen({super.key, required this.selectedDate, this.oldDream});

  final DateTime selectedDate;
  final Dream? oldDream;

  @override
  State<AddDreamScreen> createState() => _AddDreamScreenState();
}

class _AddDreamScreenState extends State<AddDreamScreen> {
  final _formKey = GlobalKey<FormState>(); // Create key to handle form
  // final _titleController = TextEditingController();
  // final _descriptionController = TextEditingController();

  var _enteredTitle = '';
  var _enteredDescription = '';
  var _selectedDreamType = dreamTypes[DreamTypes.lucid]!;

  @override
  void initState() {
    super.initState();
    if (widget.oldDream != null) {
      _enteredTitle = widget.oldDream!.title;
      _enteredDescription = widget.oldDream!.description;
      _selectedDreamType = widget.oldDream!.dreamType;
    }
  }

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
      Navigator.of(context).pop(newDream);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = dateFormatter.format(widget.selectedDate);
    final bool hasOldDream = widget.oldDream != null;

    return Container(
      decoration: const BoxDecoration(gradient: kBackgroundGradient),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hasOldDream ? 'Edit Dream' : 'New Dream'),
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
                      Text(
                        'Date: $formattedDate',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title
                  TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(labelText: 'Title'),
                    initialValue: _enteredTitle,
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
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      alignLabelWithHint: true,
                    ),
                    maxLength: 5000,
                    maxLines: null,
                    minLines: 10,
                    initialValue: _enteredDescription,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          value.trim().length <= 1) {
                        return 'Entry must have a description.';
                      }
                      return null;
                    },
                    onChanged: (value) => _enteredDescription = value,
                    onSaved: (newValue) => _enteredDescription = newValue!,
                  ),
                  const SizedBox(height: 10),

                  // Radio buttons
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dream Type:',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
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
                        title: Text(dreamTypes[DreamTypes.partlyLucid]!.title),
                        tileColor: Colors.transparent,
                        value: dreamTypes[DreamTypes.partlyLucid],
                        groupValue: _selectedDreamType,
                        onChanged: (value) {
                          setState(() {
                            _selectedDreamType = value!;
                            print(_selectedDreamType.title);
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(dreamTypes[DreamTypes.notLucid]!.title),
                        tileColor: Colors.transparent,
                        value: dreamTypes[DreamTypes.notLucid],
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
