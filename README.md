# README

[![Build Status](https://travis-ci.com/pxai/rails-devise-omniauty-api.svg?branch=master)](https://travis-ci.com/pxai/rails-devise-omniauty-api)

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

https://guides.railsgirls.com/devise
https://medium.com/@_benrudolph/end-to-end-devise-omniauth-google-api-rails-7f432b38ed75

https://dev.to/danielpenaloza/omniauth-devise-rails-tutorial-5ddi

rspec
https://www.matthewhoelter.com/2019/09/12/setting-up-and-testing-rails-6.0-with-rspec-factorybot-and-devise.html
https://blog.devgenius.io/testing-a-rails-api-with-rspec-82dedc9f15df

https://github.com/heartcombo/devise/wiki/How-To:-Test-with-Capybara

# Devise Curl

Register

```shell
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "myemail8@email.com", "password": "mypassword1", "password_confirmation" : "mypassword1"} }' http://localhost:3000/users.json -i
```

Login
```shell
curl -X POST -v -H 'Content-Type: application/json'  -i http://localhost:3000/users/sign_in.json -d '{"user" : {"email": "myemail8@email.com", "password": "mypassword1" }}'
```

Create a task:
```shell
curl -i -X POST -H "Content-Type: application/json" -H "x-myapi-token: TOKEN" http://127.0.0.1:3000/tasks --data '{"name": "Task one"}'
```

Update a task:
```shell
curl -i -X PUT -H "Content-Type: application/json" -H "x-myapi-token: TOKEN" http://127.0.0.1:3000/tasks/1 --data '{"name": "email3 referral 2", "completed": "true"}'
```

Delete One task
```shell
curl -i -X DELETE -H "Content-Type: application/json" -H "x-myapi-token:  TOKEN" http://127.0.0.1:3000/tasks/1
```

Get One task
```shell
curl -i -X GET -H "Content-Type: application/json" -H "x-myapi-token:  TOKEN" http://127.0.0.1:3000/tasks/1
```

Get Tasks
```shell
curl -i -X GET -H "Content-Type: application/json" -H "x-myapi-token: TOKEN" http://127.0.0.1:3000/tasks
```

# Reminders for RoR

# Steps

rails generate model User name:string password:string email:string active:boolean password_digest:string

rake db:migrate

rails generate model Session token:string active:boolean user:references

rake db:migrate

## General comands
Generate api-only
```shell
rails new --api app_name
```

run
```shell
rails server
```

Test
```shell
rails test
```
or
```shell
rake test
```

Console
```
rails c
```

Console with test
```
RAILS_ENV=test bin/rails db:fixtures:load
rails c -e test
```

Delete DB test
```
bundle exec rake db:reset RAILS_ENV=test
```

## Generators
Generate controlers. This is about, with about method
```shell
rails generate controller about about
```

Generate models:
```shell
rails generate model Lesson name:string description:text
```
Model with references
```
 rails g model dish name:string rating:integer restaurant:references
```

Generate resource:
```shell
rails generate resource entry title:string body:text published:boolean
rails generate resource api/v1/user email:string name:string password:string
rails generate resource api/v1/story title:string body:text published:boolean user:references
```

Generate serializers
```shell
rails g serializer category
```
jsonapi-rb:
```
rails generate jsonapi:serializable tag
```


Check routes:
```shell
rails routes
```

Then:
```shell
rake db:migrate
```
for other envs:
```shell
export RAILS_ENV=production
rake db:migrate
```

Populate the Database
```
rake db:seed
```

## Curl commands

```shell
curl http://localhost:3000/courses
```

```shell
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"title":"xyz","description":"xyz", "published": "false"}' \
  http://localhost:3000/courses
```

```shell
curl -i -X POST -H "Content-Type: application/json" -d  '{"title":"xyz","description":"xyz", "published": "false"}' http://localhost:3000/courses


## Enable access to last commit for heroku

```shell
heroku labs:enable runtime-dyno-metadata -a zabaldu
```
Where zabaldu is the name of the app.

Then we should have: `HEROKU_SLUG_COMMIT`

## rubocop

Running it:
```shell
bundle exec rubocop app
```
Autocorrect:

```shell
bundle exec rubocop -A app test
bundle exec rubocop app test
```

Gen config:
```shell
bundle exec rubocop --auto-gen-config
```





