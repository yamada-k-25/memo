# （Essentials）Fetching Website Data into Memory

## 所感
簡単なサーバとのやりとりを実装したい場合は、URLSession.sharedを使用する。systemのプロセス（background）での実行、キャッシュ管理などをしたい場合などは、URLSessionをインスタンス化して使用する。また、通信転送の進捗率、エラー、認証チャレンジなどを受け取りたい場合は、`URLSessionDelegate`、`URLSessionTaskDelegate`、`URLSessionDataDelegate`などを使用する。

## 概要
- リモートサーバとの小規模なやりとりは、URLSessionDataTaskを使用
- URLSessionDataTaskはレスポンスデータをメモリに受け取ることができる
- データをファイルシステムに直接保存するURLSessionDownloadTaskとは対照的
- Webサービスのエンドポイントを呼び出すような用途に最適


- ニーズが単純な場合は`URLSession.shared`を使用
- 転送と対応したい場合は、`URLSession`をインスタンス化する必要がある

- セッションを作成したら、dataTask()メソッドを呼び出し、DataTaskを生成する。Taskは中断した状態で作成され、`resume()`を呼び出すことで開始する。

### 注意点
- 必要以上にセッションを作成しないようにする
  - なぜか？


## Completion Handlerを使用して、結果を受け取る

![Figure 1 Creating a completion handler to receive results from a task](https://docs-assets.developer.apple.com/published/c7124fb5d7/bf4501ff-82b2-4dd4-9ec3-243ef0e70d21.png)


