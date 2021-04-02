# README

# アプリケーション名
  BulkUp
  
# アプリケーションの概要
  このアプリは筋力アップのための食事管理アプリです
  筋力アップのために必要なレシピを共有し、摂取した栄養素を可視化して管理することができます。

# 本番環境URL
  
# テスト用アカウント
  Basic認証
  ログインアカウント
  
# 利用方法
  筋力アップに特化したレシピを投稿することでレシピを共有します。摂取栄養素を入力してその日摂取した栄養素を管理します。

#  開発環境
  HTML, CSS, Ruby, Ruby on Rails, Chart.js, AWS(EC2, S3)

# 制作背景
## 目指した課題解決
  筋トレを趣味とする20〜30代の独身男性が趣味として筋トレを初めて、筋力アップのための食生活を取り入れたいけど、どういった食事を取ればいいかわからないユーザーをターゲットにしています。
  既存のレシピアプリでは筋力アップを目的としていないレシピも投稿されているため、レシピを探しづらいという課題と同じ目標を持ったユーザー同士が投稿することで解決します。
  また、一日に必要な筋力アップのための栄養素の摂取量を管理して可視化することでオリジナルの食生活ができるようサポートします。

## 実装機能
- ユーザー登録機能
- レシピ投稿機能
- レシピ一覧機能
- レシピ詳細機能
- レシピ編集機能
- レシピ削除機能
- レシピ検索機能
- 摂取栄養素管理機能

## 実装予定の機能
- マイページ機能
- お気に入り機能
- 体重管理機能
- SNS認証
  
## 実装した機能についてのGIFと説明
- ユーザー登録機能
  ユーザー情報を管理するため、ログイン機能を実装しています。
  
- レシピ投稿機能
  必要情報名情報を記載して、投稿ボタンをクリックするとレシピを投稿できます。
  
- レシピ一覧機能
  トップページにレシピ一覧を表示します。
  
- レシピ詳細機能
  レシピの詳細情報を表示します。
  
- レシピ編集機能
  投稿したレシピを編集できます。
  
- レシピ削除機能
  投稿したレシピを削除します。
  
- レシピ検索機能
  gem ransackを使って材料名、調理時間を入力すると条件にあったレシピを検索できます。
  
- 摂取栄養素管理機能
  摂取した栄養素を入力するとレーダーチャートで表示します。
  

##  工夫したポイント



# ローカルでの動作方法
  git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。

# データベース設計
## ER図 

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| gender             | integer | null: false               |
| body_weight        | integer | null: false               |
| body_height        | integer | null: false               |
| muscle_history_id  | integer | null: false               |
| basal_metabolism   | integer | null: false               |
| birthday           | date    | null: false               |

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
| foodstuff_id           | integer    | null: false       |
| user_id                | references | foreign_key: true |

### Association

- belongs_to: user

# chart テーブル
| Column       | Type       | Options           |
| -------------| ---------- | ----------------- |
| chart_date   | date       | null: false       |
| weight       | integer    | null: false       |
| protein      | integer    | null: false       |
| lipid        | integer    | null: false       |
| carbohydrate | integer    | null: false       |
| vitamin_B1   | integer    | null: false       |
| vitamin_B2   | integer    | null: false       | 
| vitamin_B6   | integer    | null: false       |
| vitamin_D    | integer    | null: false       |
| vitamin_C    | integer    | null: false       |
| user_id      | references | foreign_key: true |

### Association
- belongs_to: user
