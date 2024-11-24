テーブル設計

## usersテーブル

| Column             | Type    | options
| -------------------| --------| -------------
| nickname           | string  | null: false
| name               | string  | null: false
| encrypted_password | string  | null: false
| email              | string  | null: false, ユニーク制約
| birthday           | date    | null: false

has_many :sale_records
has_many :sale_informations

## sale_recordsテーブル

| column            | Type       | options
| ----------------- | -----------| ------------------------------
| users             | references | null: false, foreign_key: true
| sale_informations | references | unll: false, foreign_key: true

belongs_to :users
has_one :sale_informations

## shippingsテーブル

| column    | Type       | options
| --------- | ---------- | -----------
| addres    | string     | null: false
| post_code | integer    | null: false
| tel_No    | integer    | null: false

has_one :sale_informations

## sale_informationsテーブル

| column           | Type    | options
| ---------------- | ------- | -----------
| image            | string  | null: false
| sale_name        | string  | null: false
| cotegory         | string  | null: false
| explanation      | text    | null: false
| state            | string  | null: false
| postal_code      | integer | null: false
| prefecture       | integer | null: false
| city             | string  | null: false
| house_number     | integer | null: false
| building_name    | string  | null: false
| region_of_origin | string  | null: false
| shipping_days    | integer | null: false
| shipping_fee     | integer | null: false
| price            | integer | null: false

has_one :shippings
has_one :sale_records
belomgs_to :users