class Account {
  final String fullname;

//<editor-fold desc="Data Methods">

  const Account({
    required this.fullname,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          runtimeType == other.runtimeType &&
          fullname == other.fullname);

  @override
  int get hashCode => fullname.hashCode;

  @override
  String toString() {
    return 'Account{ fullname: $fullname,}';
  }

  Account copyWith({
    String? fullname,
  }) {
    return Account(
      fullname: fullname ?? this.fullname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      fullname: map['fullname'] as String,
    );
  }

/*

    //</editor-fold>
  final String? tagline;
  final String? website;
  final String? location;
  final String? emailAddress;
  final String? licence;
*/

}
