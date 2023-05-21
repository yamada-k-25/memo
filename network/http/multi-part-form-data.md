# multipart/form-data

## 参考
- [RFC 7578](https://datatracker.ietf.org/doc/html/rfc7578)
- [マルチパートアップロードを使用したオブジェクトのアップロードとコピー](https://docs.aws.amazon.com/ja_jp/AmazonS3/latest/userguide/mpuoverview.html)

## Introduction
- HTMLで表現され、フォームデータはHTTP、電子メールで送信される。
- multipart/form-dataはHTML以外のフォームにも使用される。

## Percent-Encoding Option
- ファイル名に含まれる文字をエンコードする方法

## 3. Advice for Forms and Form Processing
ファームの表現と解釈、フォーム処理の性質については本書では、規定しない。

- フィールド名は、任意のUniCodeの文字列とすることができる。
- しかし、ASCIIに限定することで、相互運用上の問題を回避することができる。

## 4. multipart/form-dataの定義

## 4.2 各パートのContent-Dispositionヘッダーフィルード
[RFC2183]Content-Dispositionヘッダーファイルード

- form-data
`Content-Disposition: form-data; name="user"`

Content-Dispositionヘッダーフィールドのfilenameでファイル名を提供する必要もある。しかし、ドラッグアンドドロップの場合、あるいはデバイスから直接ストリーミングされる場合は、必須ではない。

## 4.3 一つのフォームフィールドに複数のファイル
- あるフォームフィールドのフォームデータは、複数のファイルを含むかもしれない。しかし、この方法は非推薦である。各ファイルを別々のパートで送信し、全て同じ`name`パラメータを使用する。

## 4.4 各パートに対するContent-Type Header Field

## 4.5 ”text/plain”フォームデータのCharsetパラメータについて


