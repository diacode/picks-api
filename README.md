# Diacode Picks

Diacode Picks is a small work in progress tool which will help you building link compilations and distributing them using third party services like Mailchimp.

## Overview

Diacode Picks is an [Ember.js](http://emberjs.com) application powered by a [Rails 4.1](http://edgeguides.rubyonrails.org/4_1_release_notes.html) backend. All of this is packed in a single project helped by [ember-rails](https://github.com/emberjs/ember-rails) gem.

## Requirements

Diacode Picks is tested with the latest MRI (2.1). Other versions/VMs are untested but might work fine.

We use [Sidekiq](https://github.com/mperham/sidekiq) to delegate Mailchimp API communication. It requires to have Redis 2.4 or greater installed.

## Configuration

Before start you will have to do some quick configuration.

### Database setup

It works like all Rails applications. Just create a `config/database.yml` using `config/database.example.yml` template and execute `rake db:migrate` to run all migrations.

*Note*: **sqlite3** is the default database adapter but you can choose whatever you want by changing it on the `Gemfile`. 

### User creation

The application implements user access so you need to setup all user account before using the application. Unfortunately you can't add them through the web interface yet so you will have to create all of them using rails console. Users in the backend are managed using [Devise gem](https://github.com/plataformatec/devise).

### Mailchimp integration

Diacode Picks uses [Mailchimp](http://mailchimp.com) to send the compilations to subscribers. Within the project is attached a `config/mailchimp.example.yml` file that you have to override with your own settings. 

## Hubot integration

You can add links to the app using this [Hubot script](https://github.com/diacode/picks-hubot-script) we've written.
