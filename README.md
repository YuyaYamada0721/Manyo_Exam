# バージョン
・ Ruby：2.6.5
・ Ruby on Rails：5.2.5

# ER図
|users||
|:-|-:|
|id|
|user_name|string|
|user_email|string|
|password_digest|string|

|tasks||
|:-|-:|
|id<br>user_id(FK)<br>label_id(FK)|
|task_name|string|
|task_content|text|
|expiration_deadline|date|
|status|string|
|priority|integer|

|labels||
|:-|-:|
|id|
|label_name|string|

# Herokuへのデプロイ手順
1. Herokuにログインする
```
heroku login
```
2. Herokuに新しいアプリケーションを作成する
```
heroku create
```
3. アセットプリコンパイル
```
rails assets:precompile RAILS_ENV=production
```
4. GemfileのRubyのバージョンをコメントアウトして下記を実行
```
bundle install
```
5. コミットする
```
git add -A
git commit -m "init"
```
6. Heroku buildpackを追加する
```
heroku buildpacks:set heroku/ruby
heroku buildpacks:add --index 1 heroku/nodejs
```
7. Herokuにデプロイする
```
#masterブランチにいる時
git push heroku master
#masterブランチ以外にいる時
git push heroku 現在いるブランチ:master
```
8. Basic認証の設定をするなら
```
#設定したい"username"と"password"へ入力
heroku config:set USER=username
heroku config:set PASS=password
```
