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

## model
- user has many tasks
- task belongs to user
- task has many tags
- tag has many tasks

task
- content
- end_at
- priority
- status
- tags
- user_id

user
- name

tag
- name

## ERD
![ERD](db/erd.png)