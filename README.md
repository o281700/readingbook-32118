# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| column             | type       | option                         |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | nill: false                    |
| email              | string     | nill: false, unique: true      |
| encrypted_password | string     | nill: false                    |
| comment            | references | null: false, foreign_key: true |

### Association
- has_many :books
- has_many :comments

## booksテーブル

| colum      | type       | option                         |
| ---------- | ---------- | ------------------------------ |
| title      | string     | nill: false                    |
| author     | string     | nill: false                    |
| Impression | text       |                                |
| user       | references | null: false, foreign_key: true |
| comment    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comment

## commentテーブル

| colum | type       | option                         |
| ----- | ---------- | ------------------------------ |
| text  | text       | nill: false                    |
| user  | references | null: false, foreign_key: true |
| book  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :book
