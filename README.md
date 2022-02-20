# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
```
 2.7.2
```
* Rails version
```
5.2.6.2
```

* System dependencies
 - Rails / Ruby / Postgresql
1. install rbenv
```
$ brew install rbenv ruby-build
```
2. Set up rbenv in your shell
```
$ rbenv init
```
3. Close your terminal window and open a new one so your changes take effect
4. Verify that rbenv is properly set up using the rbenv-doctor script:

```
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
```
5. install ruby version 2.7.2
```
$ rbenv install 2.7.2
```
6. install rails
```
$ gem install rails --version=5.2.6.2

```

7. you may need to add this line to bottom of your zshrc or bashrc to run ruby
   commands

```
eval "$(rbenv init -)"
```


* How to run the test suite
```
$ bundle install
$ rails db:{drop,create}
```
1. Run tests for requests
```
$ bundle exec rspec spec/requests
```
2. Run tests for clients
```
$ bundle exec rspec spec/clients
```

4. Run entire test suit
```
$ bundle exec rspec
```


* Deployment instructions
run the rails server
```
$ rails s
```
open a web browser to http://localhost:3000 and go to the following end points
```
/api/ping
/api/posts/tags=<your_topic_goes_here> -> options params
sortBy=<your_attribute_to_sort_by> and direction=<desc> to order results in
descending order
```


