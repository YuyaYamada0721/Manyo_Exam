# タスク管理アプリケーション「Taskun」

## 概要
万葉課題

## バージョン
* バックエンド
  * Ruby 2.6.5
  * Ruby on Rails 5.2.5
  * PostgreSQL 13.3


## ER図
![ER図](https://user-images.githubusercontent.com/78161698/132078628-f8166325-5003-406a-9d76-33a278d81feb.png)


## Herokuへのデプロイ手順
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
# masterブランチにいる時
git push heroku master
# masterブランチ以外にいる時
git push heroku 現在いるブランチ:master
```
