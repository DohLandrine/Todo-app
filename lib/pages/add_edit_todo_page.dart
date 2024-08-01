import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/providers/todo_provider.dart';

class AddEditTodoPage extends StatefulWidget {
  final Todo? todo;
  final int? index;

  const AddEditTodoPage({super.key, this.index, this.todo});

  @override
  State<AddEditTodoPage> createState() => _AddEditTodoPageState();
}

class _AddEditTodoPageState extends State<AddEditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  late String? _title;
  late String? _description;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    if (widget.todo == null) {
      _title = '';
      _description = '';
      _dueDate = null;
    } else {
      _title = widget.todo!.title;
      _description = widget.todo!.description;
      _dueDate = widget.todo!.dueDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 142, 93),
        title: Text(widget.todo == null ? 'Add' : 'Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  initialValue: _title,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please Enter a Title'
                      : null,
                  onChanged: (newValue) => _title = newValue,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  initialValue: _description,
                  onChanged: (newValue) => _description = newValue,
                ),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RawMaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: const Color.fromARGB(255, 49, 86, 150),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final todoProvider =
                            Provider.of<TodoProvider>(context, listen: false);
                        widget.todo == null
                            ? todoProvider.addTodo(Todo(
                                title: _title,
                                description: _description,
                                dueDate: _dueDate))
                            : todoProvider.editTodo(
                                Todo(
                                    title: _title,
                                    description: _description,
                                    dueDate: _dueDate),
                                widget.index!);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
