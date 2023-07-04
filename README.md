# README
real-worldの仕様に則った
基本的なCRUDの機能を備えたAPIアプリケーションです。

# 事前準備
```
git clone https://github.com/tomo-git-program/real_world.git
```
を任意のカレントディレクトリで実行してください

次にプロジェクトを開き、ターミナルで
```
bundle install
```
を行ってください。

また
使用する前にpostmanで以下の動作確認をお願いします

コンソールから
```
cd .\real_world\
```
などとしてプロジェクトのディレクトリに移動してください
```
rails server
```
でサーバーを立ち上げておいてください


# postmanによる動作テストのお願い

apiを使用する前にpostmanで動作確認をお願いします。

- 「Create Article」のテスト
新たに項目を追加することができるかのテストです

エンドポイントはこちらを設定してください
```
localhost:3000/api/articles
```
ここのリクエストボディに`POST`リクエストで
```json
{"article":{"title":"How to train your dragon", "body":"Very carefully."}}
```
をbodyに添付して送信します
そうすると
```json
{
    "article": {
        "id": 7(ここは場合によって変わります),
        "slug": "how-to-train-your-dragon",
        "title": "How to train your dragon",
        "body": "Very carefully.",
        "created_at": "2023-06-18T04:27:25.866Z",
        "updated_at": "2023-06-18T04:27:25.866Z"
    }
}
```
このようなデータが返ってくれば成功です

- 「Update Articleテスト」

updateでのパスパラメータはresponseのslugをそのまま使っています
よって
```
localhost:3000/api/articles/how-to-train-your-dragon
```
このようなエンドポイントとなります。
ここに`PUT`リクエストでbodyに
```json
{
  "article": {
    "title": "Did you train your dragon?"
  }
}
```
を記述して送ります。
レスポンスとして
```json
{
    "article": {
        "title": "Did you train your dragon?",
        "id": 7,
        "slug": "how-to-train-your-dragon",
        "body": "Very carefully.",
        "created_at": "2023-06-18T04:27:25.866Z",
        "updated_at": "2023-06-18T04:53:29.180Z"
    }
}
```
titleの「How to train your dragon」が「Did you train your dragon?」に変更されていれば成功です。

「get article」
urlのパスパラメーターと同じarticleを検索して表示出来るかのテストです
```json
localhost:3000/api/articles/how-to-train-your-dragon
```
エンドポイントはこちらです。ここに`get`リクエストを送ってください

```json
{
    "article": {
        "id": 8,
        "slug": "how-to-train-your-dragon",
        "title": "How to train your dragon",
        "body": "Very carefully.",
        "created_at": "2023-06-18T04:53:07.652Z",
        "updated_at": "2023-06-18T04:53:07.652Z"
    }
}
```
slugが「how-to-train-your-dragon」が取れていれば成功です。




