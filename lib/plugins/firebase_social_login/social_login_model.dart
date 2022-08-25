class SocialLoginModel {
  bool? _status;
  String? _message;
  Result? _result;
  int? _timestamp;

  SocialLoginModel(
      {bool? status, String? message, Result? result, int? timestamp}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (result != null) {
      this._result = result;
    }
    if (timestamp != null) {
      this._timestamp = timestamp;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  Result? get result => _result;
  set result(Result? result) => _result = result;
  int? get timestamp => _timestamp;
  set timestamp(int? timestamp) => _timestamp = timestamp;

  SocialLoginModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    _timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._result != null) {
      data['result'] = this._result!.toJson();
    }
    data['timestamp'] = this._timestamp;
    return data;
  }
}

class Result {
  String? _accessToken;
  User? _user;

  Result({String? accessToken, User? user}) {
    if (accessToken != null) {
      this._accessToken = accessToken;
    }
    if (user != null) {
      this._user = user;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  User? get user => _user;
  set user(User? user) => _user = user;

  Result.fromJson(Map<String, dynamic> json) {
    _accessToken = json['access_token'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this._accessToken;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  String? _id;
  String? _name;
  String? _image;
  String? _userNo;
  String? _email;
  String? _uid;
  bool? _emailVerified;
  String? _userId;

  User(
      {String? id,
        String? name,
        String? image,
        String? userNo,
        String? email,
        String? uid,
        bool? emailVerified,
        String? userId}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
    }
    if (userNo != null) {
      this._userNo = userNo;
    }
    if (email != null) {
      this._email = email;
    }
    if (uid != null) {
      this._uid = uid;
    }
    if (emailVerified != null) {
      this._emailVerified = emailVerified;
    }
    if (userId != null) {
      this._userId = userId;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get userNo => _userNo;
  set userNo(String? userNo) => _userNo = userNo;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get uid => _uid;
  set uid(String? uid) => _uid = uid;
  bool? get emailVerified => _emailVerified;
  set emailVerified(bool? emailVerified) => _emailVerified = emailVerified;
  String? get userId => _userId;
  set userId(String? userId) => _userId = userId;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _userNo = json['userNo'];
    _email = json['email'];
    _uid = json['uid'];
    _emailVerified = json['emailVerified'];
    _userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['userNo'] = this._userNo;
    data['email'] = this._email;
    data['uid'] = this._uid;
    data['emailVerified'] = this._emailVerified;
    data['userId'] = this._userId;
    return data;
  }
}