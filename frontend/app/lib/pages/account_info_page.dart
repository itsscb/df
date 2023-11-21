import 'package:app/model/services/storage_service.dart';
import 'package:app/model/view_model/base_vm.dart';
import 'package:app/pages/late_person_page.dart';
import 'package:app/pages/loading_page.dart';
import 'package:app/pages/notifications_page.dart';
import 'package:app/util/colors.dart';
import 'package:app/util/validation.dart';
import 'package:app/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({super.key});

  @override
  State<AccountInfoPage> createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  bool _loading = true;
  final StorageService _storageService = StorageService();
  final BaseViewModel _vm = BaseViewModel();
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _zipController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _birthPlaceController = TextEditingController();

  DateTime? _birthday;
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _streetController.dispose();
    _houseNumberController.dispose();
    _zipController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _birthPlaceController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _init() async {
    _countryController.text = 'Deutschland';
    if (await _storageService.accountLevel < 5) {
      await _storageService.setAccountLevel(5);
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
        data: ThemeData.dark(),
        child: child ?? const Text(''),
      ),
      initialDate: DateTime.now().add(const Duration(days: 365 * -18)),
      firstDate: DateTime.now().add(const Duration(days: 365 * -100)),
      lastDate: DateTime.now().add(const Duration(days: 365 * -18)),
    );
    // firstDate: DateTime.now().add(const Duration(days: 365 * -100)),
    // lastDate: DateTime.now().add(const Duration(days: 365 * -18)));
    if (picked != null && picked != _birthday) {
      setState(() {
        _birthday = picked;
        _birthdayController.text =
            '${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CustomScaffold(
        backButton: BackButton(
          color: CustomColors.primary,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => const NotificationsPage()));
          },
        ),
        children: _loading
            ? [
                LoadingPage(),
              ]
            : [
                const Text(
                  'Registrierung abschließen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height:
                      MediaQuery.of(context).viewInsets.bottom > 0 ? 230 : 460,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Stack(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _firstNameController,
                                autocorrect: false,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  label: Text('Vorname'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || !value.isValidName) {
                                    return 'Bitte einen gültigen Vornamen eingeben';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _lastNameController,
                                autocorrect: false,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  label: Text('Nachname'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || !value.isValidName) {
                                    return 'Bitte einen gültigen Nachnamen eingeben';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _streetController,
                                autocorrect: false,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  label: Text('Straße'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.streetAddress,
                                validator: (value) {
                                  if (value == null ||
                                      !value.isValidStreetAddress) {
                                    return 'Bitte eine gültige Straße eingeben';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 130,
                                    child: TextFormField(
                                      controller: _houseNumberController,
                                      autocorrect: false,
                                      autofocus: true,
                                      decoration: const InputDecoration(
                                        label: Text('Hausnummer'),
                                        filled: true,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null ||
                                            !value.isValidHouseNumber) {
                                          return 'Nur Zahlen erlaubt';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 160,
                                    child: TextFormField(
                                      controller: _zipController,
                                      autocorrect: false,
                                      autofocus: true,
                                      decoration: const InputDecoration(
                                        label: Text('Postleitzahl'),
                                        filled: true,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null ||
                                            !value.isValidZip) {
                                          return 'Bitte eine gültige Postleitzahl eingeben';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _cityController,
                                autocorrect: false,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  label: Text('Stadt'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || !value.isValidCity) {
                                    return 'Bitte einen gültigen Ort eingeben';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _countryController,
                                autocorrect: false,
                                autofocus: true,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  label: Text('Land'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || !value.isValidName) {
                                    return 'Bitte einen gültigen Ort eingeben';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _phoneController,
                                autocorrect: false,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  label: Text('Telefonnummer'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || !value.isValidPhone) {
                                    return 'Bitte eine gültige Telefonnummer eingeben';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                onTap: () => _selectDate(context),
                                controller: _birthdayController,
                                autocorrect: false,
                                autofocus: true,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  label: Text('Geburtsdatum'),
                                  filled: true,
                                ),
                                keyboardType: TextInputType.datetime,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Bitte ein gültiges Datum eingeben';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Hero(
                  tag: 'flow-button',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primary,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final resp = await _vm.createAccountInfo(
                          context,
                          firstname: _firstNameController.text,
                          lastname: _lastNameController.text,
                          city: _cityController.text,
                          country: _countryController.text,
                          zip: _zipController.text,
                          phoneNumber: _phoneController.text,
                          streetAddress: _streetController.text,
                          birthday: _birthday!,
                        );

                        if (resp) {
                          if (mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const LatePersonPage(),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weiter',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
