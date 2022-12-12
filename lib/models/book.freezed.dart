// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PdfBook _$PdfBookFromJson(Map<String, dynamic> json) {
  return _PdfBook.fromJson(json);
}

/// @nodoc
mixin _$PdfBook {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfBookCopyWith<PdfBook> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfBookCopyWith<$Res> {
  factory $PdfBookCopyWith(PdfBook value, $Res Function(PdfBook) then) =
      _$PdfBookCopyWithImpl<$Res, PdfBook>;
  @useResult
  $Res call({int id, String title, String path});
}

/// @nodoc
class _$PdfBookCopyWithImpl<$Res, $Val extends PdfBook>
    implements $PdfBookCopyWith<$Res> {
  _$PdfBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PdfBookCopyWith<$Res> implements $PdfBookCopyWith<$Res> {
  factory _$$_PdfBookCopyWith(
          _$_PdfBook value, $Res Function(_$_PdfBook) then) =
      __$$_PdfBookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String path});
}

/// @nodoc
class __$$_PdfBookCopyWithImpl<$Res>
    extends _$PdfBookCopyWithImpl<$Res, _$_PdfBook>
    implements _$$_PdfBookCopyWith<$Res> {
  __$$_PdfBookCopyWithImpl(_$_PdfBook _value, $Res Function(_$_PdfBook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? path = null,
  }) {
    return _then(_$_PdfBook(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PdfBook extends _PdfBook {
  _$_PdfBook({required this.id, required this.title, required this.path})
      : super._();

  factory _$_PdfBook.fromJson(Map<String, dynamic> json) =>
      _$$_PdfBookFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String path;

  @override
  String toString() {
    return 'PdfBook(id: $id, title: $title, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PdfBook &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PdfBookCopyWith<_$_PdfBook> get copyWith =>
      __$$_PdfBookCopyWithImpl<_$_PdfBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PdfBookToJson(
      this,
    );
  }
}

abstract class _PdfBook extends PdfBook {
  factory _PdfBook(
      {required final int id,
      required final String title,
      required final String path}) = _$_PdfBook;
  _PdfBook._() : super._();

  factory _PdfBook.fromJson(Map<String, dynamic> json) = _$_PdfBook.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_PdfBookCopyWith<_$_PdfBook> get copyWith =>
      throw _privateConstructorUsedError;
}
