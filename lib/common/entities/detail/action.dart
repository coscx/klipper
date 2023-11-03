import 'dart:convert';
import 'dart:developer';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();
  static T? Function<T extends Object?>(dynamic value) convert =
  <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
  }
  if ('' is T) {
    return '' as T;
  } else if (0 is T) {
    return 0 as T;
  } else if (0.0 is T) {
    return 0.0 as T;
  } else if (false is T) {
    return false as T;
  }
  return defaultValue;
}

class UserActionDataResult {
  UserActionDataResult({
    required this.msg,
    required this.code,
    required this.data,
  });

  factory UserActionDataResult.fromJson(Map<String, dynamic> json) =>
      UserActionDataResult(
        msg: asT<String>(json['msg'])!,
        code: asT<int>(json['code'])!,
        data: UserActionData.fromJson(asT<Map<String, dynamic>>(json['data'])!),
      );

  String msg;
  int code;
  UserActionData data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'msg': msg,
    'code': code,
    'data': data,
  };
}

class UserActionData {
  UserActionData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory UserActionData.fromJson(Map<String, dynamic> json) {
    final List<UserAction>? data = json['data'] is List ? <UserAction>[] : null;
    if (data != null) {
      for (final dynamic item in json['data']!) {
        if (item != null) {
          tryCatch(() {
            data.add(UserAction.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return UserActionData(
      currentPage: asT<int>(json['current_page'])!,
      data: data!,
      firstPageUrl: asT<String>(json['first_page_url'])!,
      from: asT<int>(json['from'])!,
      lastPage: asT<int>(json['last_page'])!,
      lastPageUrl: asT<String>(json['last_page_url'])!,
      nextPageUrl: asT<Object?>(json['next_page_url']),
      path: asT<String>(json['path'])!,
      perPage: asT<int>(json['per_page'])!,
      prevPageUrl: asT<Object?>(json['prev_page_url']),
      to: asT<int>(json['to'])!,
      total: asT<int>(json['total'])!,
    );
  }

  int currentPage;
  List<UserAction> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  Object? nextPageUrl;
  String path;
  int perPage;
  Object? prevPageUrl;
  int to;
  int total;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'current_page': currentPage,
    'data': data,
    'first_page_url': firstPageUrl,
    'from': from,
    'last_page': lastPage,
    'last_page_url': lastPageUrl,
    'next_page_url': nextPageUrl,
    'path': path,
    'per_page': perPage,
    'prev_page_url': prevPageUrl,
    'to': to,
    'total': total,
  };
}

class UserAction {
  UserAction({
    required this.id,
    required this.username,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory UserAction.fromJson(Map<String, dynamic> json) => UserAction(
    id: asT<int>(json['id'])!,
    username: asT<String>(json['username'])!,
    title: asT<String>(json['title'])!,
    content: asT<String>(json['content'])!,
    createdAt: asT<String>(json['created_at'])!,
  );

  int id;
  String username;
  String title;
  String content;
  String createdAt;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'username': username,
    'title': title,
    'content': content,
    'created_at': createdAt,
  };
}
