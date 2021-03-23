# README

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
| cooking_time_id        | integer    | null: false       |
| cooking_method         | text       | null: false       |
| foodstuff_id           | integer    | null: false       |
| user_id                | references | foreign_key: true |
### Association

- belongs_to: user

# chart テーブル
| Column       | Type       | Options           |
| -------------| ---------- | ----------------- |
| date         | date       | null: false       |
| protein      | integer    | null: false       |
| lipid        | integer    | null: false       |
| carbohydrate | integer    | null: false       |
| vitamin_B6   | integer    | null: false       |
| vitamin_D    | integer    | null: false       |
| vitamin_C    | integer    | null: false       |
| user_id      | references | foreign_key: true |

- belongs_to: user