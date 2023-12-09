import 'package:flutter/material.dart';

class PlayerUpdate extends StatelessWidget {
  const PlayerUpdate({super.key});


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "Profile update",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            pinned: true,
            centerTitle: false,
          ),
        ],
      ),
    );
  }
}

/*
typedef UpdatePlayerFunction = Function(Player);

class PlayerEdit extends StatefulWidget {
  final Player? player;
  final UpdatePlayerFunction? updated;

  const PlayerEdit({super.key, required this.player, this.updated});

  @override
  State<PlayerEdit> createState() => _PlayerEditState();
}

class _PlayerEditState extends State<PlayerEdit> {
  final _formKey = GlobalKey<FormState>();
  final _fullname = TextEditingController();
  final _role = TextEditingController();
  final _nationality = TextEditingController();
  final _birthdate = TextEditingController();
  final _weight = TextEditingController();
  final _height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localize = AppLocalizations.of(context);
    final Player player = widget.player ?? Player();

    _fullname.text = player.fullname;
    _role.text = player.role ?? "";
    _nationality.text = player.nationality ?? "";
    if (player.birthdate != null) {
      final date = player.birthdate ?? DateTime.now();
      _birthdate.text = DateFormat.yMMMd().format(date);
    }
    _weight.text = player.weight?.toString() ?? "";
    _height.text = player.height?.toString() ?? "";

    /// Title of navbar
    String titleAppBar() {
      if (widget.player != null) {

        return localize?.update_player.capitalize() ?? "";
      }
      return localize?.create_player.capitalize() ?? "";
    }

    /// Field of fullname
    Widget fullnameTextField() => TextFormField(
      controller: _fullname,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        prefixIcon: const Icon(Icons.person),
        hintText: localize?.enter_player_fullname.capitalize(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return localize?.enter_player_fullname_error.capitalize();
        }
        return null;
      },
    );

    /// Field of role
    Widget roleTextField() => TextFormField(
      controller: _role,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.sports_soccer),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        hintText: localize?.enter_player_role.capitalize(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return localize?.enter_player_role_error.capitalize();
        }
        return null;
      },
    );

    /// Field of nationality
    Widget nationalityTextField() => TextFormField(
        controller: _nationality,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.flag_outlined),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          hintText: localize?.enter_player_nationality.capitalize(),
        ),
    );

    /// Field of birthdate
    Widget birthdateTextField() => TextFormField(
        controller: _birthdate,
        keyboardType: TextInputType.datetime,
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          prefixIcon: const Icon(Icons.calendar_today),
          hintText: localize?.birthdate_player.capitalize(),
        ),
        onTap: () async {

          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            _birthdate.text = DateFormat.yMMMd().format(pickedDate);
          }
        }
    );

    /// Field of weight
    Widget weightTextField() => TextFormField(
        controller: _weight,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.monitor_weight_outlined),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          hintText: localize?.enter_weight.capitalize(),
        )
    );

    /// Field of height
    Widget heightTextField() => TextFormField(
        controller: _height,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.height_outlined),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          hintText: localize?.enter_height.capitalize(),
        )
    );

    /// Save data and pop back
    void savePlayer() {

      if (_formKey.currentState!.validate()) {

        player.fullname = _fullname.text;
        player.role = _role.text;
        player.nationality = _nationality.text;
        player.birthdate = DateFormat.yMMMd().parse(_birthdate.text);
        player.weight = double.tryParse(_weight.text);
        player.height = double.tryParse(_height.text);

        objectBox.playerBox.put(player);
        if (widget.updated != null) {
          widget.updated!(player);
        }
        Navigator.pop(context, player);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(titleAppBar())),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 80),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                fullnameTextField(),
                const SizedBox(height: 10),
                roleTextField(),
                const SizedBox(height: 10),
                nationalityTextField(),
                const SizedBox(height: 10),
                birthdateTextField(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: weightTextField()),
                    const SizedBox(width: 10),
                    Expanded(child: heightTextField()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: double.infinity,
        child: FloatingActionButton.extended(
          label: Text(localize?.save.toUpperCase() ?? ""),
          onPressed: () => savePlayer(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

*/
