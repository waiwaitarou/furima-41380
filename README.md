テーブル設計

## usersテーブル

| Column             | Type    | options
| -------------------| --------| -------------
| nickname           | string  | null: false
| familyname_kanzi   | string  | null: false
| firstname_kanzi    | string  | null: false
| familyname_kana    | string  | null: false
| firstname_kana     | string  | null: false
| encrypted_password | string  | null: false
| email              | string  | null: false, unique: true
| birthday           | date    | null: false

has_many :sale_record
has_many :item

## sale_recordsテーブル

| column           | Type       | options
| ---------------- | -----------| ------------------------------
| user             | references | null: false, foreign_key: true
| item             | references | unll: false, foreign_key: true

belongs_to :user
belongs_to :item

## shippingsテーブル

| column           | Type       | options
| ---------------- | ---------- | -----------
| postal_code      | string     | null: false
| prefecture_id    | integer    | null: false
| city             | string     | null: false
| house_number     | integer    | null: false
| building_name    | string     | null: false
| region_of_origin | string     | null: false
| tel_No           | string     | null: false
| sale_record      | references | null: false, foreign_key: true

has_one :item

## itemsテーブル

| column          | Type       | options
| --------------- | ---------- | -----------
| sale_name       | string     | null: false
| cotegory_id     | integer    | null: false
| explanation     | text       | null: false
| state_id        | integer    | null: false
| shipping_day_id | integer    | null: false
| shipping_fee_id | integer    | null: false
| price           | integer    | null: false
| prefecture_id   | integer    | null: false
| user            | references | null: false, foreign_key: true

has_one :sale_record
belongs_to :user