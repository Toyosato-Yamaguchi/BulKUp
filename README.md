# README

# アプリケーション名
  BulkUp
  
# アプリケーションの概要
  このアプリは筋力アップのための食事管理アプリです
  筋力アップのために必要なレシピを共有し、摂取した栄養素を可視化して管理することができます。
  
# 本番環境
http://18.182.198.227/

## テスト用アカウント
### Basic認証
  - ID: yama
  - password: 2222
### ログインアカウント
  - ID: yama@gmail.com
  - Password: 111aaa
  
# 利用方法
  筋力アップに特化したレシピを投稿することでレシピを共有します。摂取栄養素を入力してその日摂取した栄養素を管理します。

# 制作背景
## 目指した課題解決
  筋トレを趣味とする20〜30代の独身男性が趣味として筋トレを初めて、筋力アップのための食生活を取り入れたいけど、どういった食事を取ればいいかわからないユーザーをターゲットにしています。
  既存のレシピアプリでは筋力アップを目的としていないレシピも投稿されているため、レシピを探しづらいという課題と同じ目標を持ったユーザー同士が投稿することで解決します。
  また、一日に必要な筋力アップのための栄養素の摂取量を管理して可視化することで筋力アップための食生活ができるようサポートします。

# 実装機能
- ユーザー登録機能
- レシピ投稿機能
- レシピ一覧機能
- レシピ詳細機能
- レシピ編集機能
- レシピ削除機能
- レシピ検索機能
- 摂取栄養素管理機能

# 実装予定の機能
- コメント投稿機能
- お気に入り機能
- 体重管理機能
- SNS認証
  
# 実装した機能についてのGIFと説明
- 新規登録画面
  ![新規登録画面](https://user-images.githubusercontent.com/78126456/114028303-4a6a9900-98b3-11eb-8a12-c604b6dcd130.gif)
  ユーザー情報を管理するため
- ログイン画面
  ![ログイン画面](https://user-images.githubusercontent.com/78126456/114028194-2c9d3400-98b3-11eb-9f0f-c0c8c5df9879.gif)
  
- レシピ一覧機能（トップページ画面）
　![トップページ](https://user-images.githubusercontent.com/78126456/114027993-f1026a00-98b2-11eb-955d-998835bfb26d.gif)
  トップページにレシピ一覧を表示します。
  
- レシピ投稿機能
  ![レシピ投稿機能](https://user-images.githubusercontent.com/78126456/114028137-198a6400-98b3-11eb-97f3-c7bc8885b347.gif)
  必要情報名情報を記載して、投稿ボタンをクリックするとレシピを投稿できます。
  
- レシピ詳細機能
  ![レシピ詳細画面](https://user-images.githubusercontent.com/78126456/114028086-08d9ee00-98b3-11eb-9a5a-7b907d0f008d.gif)
  レシピ一覧に表示されているレシピの詳細情報を表示します。
  
- レシピ編集機能
  ![レシピ編集画面](https://user-images.githubusercontent.com/78126456/114034266-fd89c100-98b8-11eb-933e-a46f1748d833.gif)
  投稿したレシピを編集できます。
  
- レシピ削除機能
  ![レシピ削除機能](https://user-images.githubusercontent.com/78126456/114034604-480b3d80-98b9-11eb-8501-fcd5f970ceb3.gif)
  投稿したレシピを削除します。
  
- レシピ検索機能
  ![レシピ検索機能](https://user-images.githubusercontent.com/78126456/114028045-feb7ef80-98b2-11eb-8482-7207ed862e8c.gif)
  材料名、調理時間を入力すると条件にあったレシピを検索できます。
  
- 摂取栄養素管理機能
  ![摂取栄養素一覧画面](https://user-images.githubusercontent.com/78126456/114028434-6e2ddf00-98b3-11eb-8e73-49ede53f27c8.gif)
  摂取した栄養素を入力するとレーダーチャートで表示します。
  レシピ投稿機能と同様に登録した栄養素を編集、削除できます。
  

#  工夫したポイント
  摂取した栄養素をグラフで表示する際にはPFCバランスとビタミン群の二つのレーダーチャートで表示してあげることで、
  摂取したバランスがわかりやすいように実装しました。

# 使用技術（開発環境）
## バックエンド
Ruby, Runy on Rails

## フロントエンド
HTML, CSS, JavaScript

## データベース
MySQL, SequelPro

## インフラ
AWS(EC2),Capistrano

## Webサーバ（本番環境）
Nginx

## アプリケーションサーバ（本番環境）
Unicorn

## ソース管理
GitHub,　GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# データベース設計
## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| gender             | integer | null: false               |
| body_weight        | integer | null: false               |
| body_height        | integer | null: false               |
| birthday           | date    | null: false               |
| muscle_history     | integer |                           |

### Association

- has_many: recipes
- has_many: charts

# recipes テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| recipe_name            | string     | null: false       |
| ingredients            | string     | null: false       |
| nutrition              | string     | null: false       |
| cooking_method         | text       | null: false       |
| cooking_time_id        | integer    | null: false       |
| user_id                | references | foreign_key: true |

### Association

- belongs_to: user

# chart テーブル
| Column       | Type       | Options           |
| -------------| ---------- | ----------------- |
| chart_date   | date       | null: false       |
| weight       | float      | null: false       |
| protein      | float      | null: false       |
| lipid        | float      | null: false       |
| carbohydrate | float      | null: false       |
| vitamin_B1   | float      | null: false       |
| vitamin_B2   | float      | null: false       | 
| vitamin_B6   | float      | null: false       |
| vitamin_D    | float      | null: false       |
| vitamin_C    | float      | null: false       |
| user_id      | references | foreign_key: true |

### Association
- belongs_to: user
