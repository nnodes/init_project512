# Nnodes Defaults
Ruby 2.4.1

Rails 5.1.2+

### Setup
`git clone git@github.com:nnodes/init_project512.git`

`bundle install`

`yarn install`

Setup config/database.yml

Example:
```yaml
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000
  encoding: utf-8
  username: USERNAME
  password: 'PASSWORD'
development:
  <<: *default
  database: dev_db
test:
  <<: *default
  database: test_db
production:
  <<: *default
  database: prod_db
```
Setup config/secrets.yml

Example:
```yaml
development:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
test:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

Setup .env

Example:
```
SECRET_KEY_BASE=sample
SMPT_USERNAME=username
SMPT_PASSWORD=password
```
`rails db:create`

`rails db:migrate`

Optional:
`rails db:seed`
