## URL Loading System

### 所感
このシステムのおかげで、非同期的にアプリはWebとの接続を行うことができる。URLSessionを使うことで、キャッシュ、クッキー、バックグラウンドなどのどうWebとやりとりを行うかを制御することができる。

- 読み込みは非同期で行われる
- アプリは応答性を維持しながら、データやエラーを処理することができる


- URLSessionConfiguration
  - キャッシュ、クッキー、携帯電話ネットワークでの接続を許可するなどの動作を制御することができる

- １つのセッションを繰り返し使用することができる
- 通常ブラウジング用セッション、プライベート用のキャッシュをしないセッションのようにセッションを分けて使用することができる

![二つのセッション](https://docs-assets.developer.apple.com/published/4bf9c6d271/6789dd96-afdc-4c18-b8eb-01f9012dc04d.png)


