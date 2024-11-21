テーブル設計

## usersテーブル

| Column             | Type    | options    
| -------------------| --------| ----------
| nickname           | string  | null: false
| name               | string  | null: false
| encrypted_password | string  | null: false
| email              | string  | null: false, ユニーク制約
| birthday           | integer | null: false

## sale_recordテーブル

| column  | Type       | options
| ------- | -----------| ------------------------------
| user    | references | null: false, foreign_key: true
| sale    | references | unll: false, foreign_key: true
| shpping | references | null: false, foreign_key: true

## shipping

| column   | Type       | options
| -------- | ---------- | -----------
| area     | references | null: false
| area_fee | references | null: false

## sale

| column      | Type    | options
| ----------- | ------- | -----------
| sale_name   | string  | null: false
| cotegory    | string  | null: false
| explanation | string  | null: false
| state       | string  | null: false
| area        | string  | null: false
| area_fee    | integer | null: false
| days        | integer | null: false