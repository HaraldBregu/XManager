import 'package:flutter/material.dart';
import 'package:xmanager/src/shared/widgets/profile_header_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        //barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _ProfileHeader(),
          const ProfileHeaderCard(),
          /*SliverToBoxAdapter(
            child: Divider(
              height: 40,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: context.colorScheme.surface,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "DISPOSITIVI",
                style: TextStyle(
                  fontSize: context.textTheme.bodySmall?.fontSize,
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ),
          const ProfileDeviceCard(),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextButton(
                onPressed: () => context.pushNamed('Player update'),
                child: const Text(
                  "Edit profile",
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextButton(
                onPressed: () => _showMyDialog(),
                child: Text(
                  "Delete profile",
                  style: TextStyle(color: context.colorScheme.error),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          fontWeight: FontWeight.w900,
        ),
      ),
      pinned: true,
      centerTitle: false,
    );
  }
}
/*
class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.phone),
                hintText: 'Enter email address',
                labelText: 'Email',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.email),
                hintText: 'Enter email address',
                labelText: 'Email',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              obscuringCharacter: "*",
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.key),
                hintText: 'Password',
                labelText: 'Password',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text("SAVE"),
            ),
          ],
        ),
      ),
   
    );
  }
}

*/

/**
 
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
