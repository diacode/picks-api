# Picks API

Diacode Picks is a small work in progress tool which will help you building link compilations and distributing them using third party services like Mailchimp. This particular project is based on [Rails 4.1](http://edgeguides.rubyonrails.org/4_1_release_notes.html) and acts as the backend of our app.

## Drastic changes

### Frontend removed

Unlike the previous version right now the project doesn't include a frontend part built in as it did before relying on Ember.js and ember-rails gem.

We plan to release a frontend for it in the future as a standalone project however at this moment we don't have anything yet.

### Managing and publishing compilations

Links model now includes an `approved` column. This way you can manage the compilations build and publishing in a different manner. You can auto publish compilations using `lib/tasks/buffer_watch.rake` once your 'buffer' of approved links has reached a threshold.

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

### Twitter integration

There is a twitter integration to publish links whenever they are marked as approved. This task is delegated to sidekiq's `TweetLinkWorker`. 

Like mailchimp you will have to rename `config/twitter.example.yml` file to `config/twitter.yml` and fill it with your own settings.

If you are not interested in sharing links to twitter you can disable this integration by changing `config.tweet_approved_links` to `false` in `config/application.rb`.

## Hubot integration

You can add links to the app using this [Hubot script](https://github.com/diacode/picks-hubot-script) we've written.
