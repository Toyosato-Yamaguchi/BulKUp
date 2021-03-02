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


