import 'package:flutter/material.dart';

const List<String> categoryList = <String>[
  'Oziq-ovqat',
  'Transport',
  'Uy-joy',
  'Kommunal to‘lovlar',
  'Ko‘ngilochar',
  'Sog‘liq',
  'Ta’lim',
  'Kiyim',
  'Restoran',
  'Boshqa',
];

class CreateExpense extends StatefulWidget {
  const CreateExpense({super.key});

  @override
  State<CreateExpense> createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();
  final _noteController = TextEditingController();

  String categoryDropdownValue = categoryList.first;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final double? amount = double.tryParse(_amountController.text);
      final String category = _categoryController.text;
      final String date = _dateController.text;
      final String note = _noteController.text;

      // Example: print or send to backend
      print('Miqdor: $amount');
      print('Kategoriya: $category');
      print('Sana: $date');
      print('Izoh: $note');

      // Here you could:
      // - save to database
      // - send to API
      // - clear form
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Xarajat saqlandi")));
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    _noteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Text(
              "Xarajat qo'shish",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 15),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    hintText: 'Miqdor',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 12.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Miqdor kiriting';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButtonFormField<String>(
                  initialValue: categoryDropdownValue,
                  decoration: const InputDecoration(
                    hintText: 'Kategoriya',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 12.0,
                    ),
                  ),
                  items: categoryList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      categoryDropdownValue = newValue!;
                      _categoryController.text = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kategoriyani tanlgang';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Sana',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 12.0,
                    ),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Sana tanlang';
                    }
                    return null;
                  },
                  onTap: () async {
                    FocusScope.of(
                      context,
                    ).requestFocus(FocusNode()); // hide keyboard
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null) {
                      setState(() {
                        _dateController.text =
                            "${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}";
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: _noteController,
                  minLines: 4,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: "Izoh",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(245, 240, 240, 1.0),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: _submit,
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFEB2933),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Saqlash',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
