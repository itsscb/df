import 'package:app/model/view_model/persons_vm.dart';
import 'package:app/pb/google/protobuf/timestamp.pb.dart';
import 'package:app/pb/person.pb.dart';
import 'package:app/util/validation.dart';
import 'package:app/widgets/background.dart';
import 'package:app/widgets/bottom_navigation.dart';
import 'package:app/widgets/bottom_navigation_item.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

Future<Person> showPerson(BuildContext context, {Person? person}) async {
  PersonsViewModel vm = PersonsViewModel();

  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();
  final streetController = TextEditingController();
  final countryController = TextEditingController();
  final birthdayController = TextEditingController();

  Future<void> _init() async {
    if (person == null) {
      person ??= Person();
      // person ??= Person(accountId: await BackendService.accountId);
    } else {
      firstnameController.text = person!.firstname;
      lastnameController.text = person!.lastname;
      cityController.text = person!.city;
      zipController.text = person!.zip;
      streetController.text = person!.street;
      countryController.text = person!.country;
      birthdayController.text =
          DateFormat('dd.MM.yyyy').format(person!.birthday.toDateTime());
    }
  }

  await _init();

  void _updateData() {
    person!.firstname = firstnameController.text;
    person!.lastname = lastnameController.text;
    person!.city = cityController.text;
    person!.street = streetController.text;
    person!.zip = zipController.text;
    person!.country = countryController.text;
  }

  Future<void> createPerson(BuildContext context) async {
    final navigator = Navigator.of(context);
    _updateData();
    person!.id = Int64(0);
    person = await vm.createPerson(context,
        firstname: person!.firstname,
        lastname: person!.lastname,
        street: person!.street,
        zip: person!.zip,
        city: person!.city,
        country: person!.country,
        birthday: person!.birthday);

    if (person!.id != 0) {
      navigator.pop(person);
    }
  }

  Future<void> updatePerson(BuildContext context) async {
    final navigator = Navigator.of(context);
    _updateData();
    final personUpdate = await vm.updatePerson(context,
        id: person!.id,
        firstname: person!.firstname != firstnameController.text
            ? person!.firstname
            : null,
        lastname: person!.lastname != lastnameController.text
            ? person!.lastname
            : null,
        street: person!.street != streetController.text ? person!.street : null,
        zip: person!.zip != zipController.text ? person!.zip : null,
        city: person!.city != cityController.text ? person!.city : null,
        country:
            person!.country != countryController.text ? person!.country : null,
        birthday:
            DateFormat('dd.MM.yyyy').format(person!.birthday.toDateTime()) !=
                    birthdayController.text
                ? person!.birthday
                : null);

    if (personUpdate != person) {
      navigator.pop(person);
    }
  }

  // ignore: use_build_context_synchronously
  await showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Background(
          child: Scaffold(
            bottomNavigationBar: BottomNavigation(
              hideMenu: true,
              children: [
                BottomNavigationItem(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icons.arrow_back,
                  color: Colors.white,
                  label: 'Zurück',
                ),
                BottomNavigationItem(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icons.home,
                  color: Colors.white,
                  label: 'Home',
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    person!.id == 0 ? 'Person anlegen' : 'Person anpassen',
                    style: const TextStyle(
                        fontFamily: 'sans-serif',
                        fontSize: 24,
                        height: 1.6,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 6),
                  ),
                  ChangeNotifierProvider<PersonsViewModel>(
                    create: (context) => PersonsViewModel(),
                    child: Consumer<PersonsViewModel>(
                      builder: (context, value, child) => Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: firstnameController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('Vorname'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'Vorname',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || !value.isValidName) {
                                  return 'Bitte einen gültigen Vornamen eingeben';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: lastnameController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('Nachname'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'Nachname',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || !value.isValidName) {
                                  return 'Bitte einen gültigen Nachnamen eingeben';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  locale: const Locale('de', 'DE'),
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1930),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                  builder: (context, child) => Theme(
                                    data: ThemeData.dark(),
                                    child: child != null ? child : Text(''),
                                  ),
                                );

                                if (pickedDate != null) {
                                  person!.birthday =
                                      Timestamp.fromDateTime(pickedDate);
                                  birthdayController.text =
                                      DateFormat('dd.MM.yyyy')
                                          .format(pickedDate);
                                }
                              },
                              controller: birthdayController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('Geburtstag'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'Geburtstag',
                              ),
                              keyboardType: TextInputType.name,
                              // validator: (value) {
                              //   if (value == null || !value.isValidName) {
                              //     return 'Bitte einen gültigen Nachnamen eingeben';
                              //   }
                              //   return null;
                              // },
                            ),
                            TextFormField(
                              controller: streetController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('Straße'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'Straße mit Hausnummer',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || !value.isValidName) {
                                  return 'Bitte eine gültige Straße mit Hausnummer eingeben';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: zipController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('PLZ'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'PLZ',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || !value.isValidName) {
                                  return 'Bitte eine gültige PLZ eingeben';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('Stadt'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'Stadt',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || !value.isValidName) {
                                  return 'Bitte eine gültige Stadt eingeben';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: countryController,
                              decoration: const InputDecoration(
                                fillColor: Color.fromARGB(30, 255, 255, 255),
                                filled: true,
                                suffix: Text('Land'),
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                ),
                                hintText: 'Land',
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || !value.isValidName) {
                                  return 'Bitte ein gültiges Land eingeben';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    person!.id.isZero
                                        ? await createPerson(context)
                                        : await updatePerson(context);
                                  },
                                  child: const Icon(Icons.update),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.black);
  return person!;
}
