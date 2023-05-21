# URLSession

## Upload
### Body
以下の３種類の方法でアップロード可能
- Dataオブジェクト
- ファイル
- ストリーム


- バックグラウンドと対話的な両方に対応

- URLSessionUpload

### Usage
- Dataを用意
- URLRequestを用意
- URLSessionUploadTaskの作成
- URLSessionUploadTaskの開始

### Ref
- [Uploading Data to a Website](https://developer.apple.com/documentation/foundation/url_loading_system/uploading_data_to_a_website)



## Ref
- [【Swift】URLSessionまとめ](https://qiita.com/shiz/items/09523baf7d1cd37f6dee)


## Case

### 1. データ量の多いファイルをアップロード
アップロードに長時間かかる場合は、単一のデータブロックではなく、継続的なストリームを使用してデータをアップロードする。

- URLSessionUploadTaskを使う

1. URLSessionを作成
2. Streaming Upload Taskを作成
3. InputStreamを提供するために、ストリームのペアを作成
- 十分なバッファサイズが必要な事に注意する
- 出力ストリームのデリゲートを設定する事で、出力ストリームがデータを受け取る準備ができたイベントを受け取ることができる
4. Upload Taskへのストリームを提供
5. 準備ができたとき、Streamへデータを書き込む

- 一度OutputStreamに書き込むと、StreamDelegateが新しいhasSpaceAvailableイベントを受信するまで、再び書き込むことはできない。canWriteプロパティをfalseにする事で、この制約を強めている。
