module Sooner
  mattr_accessor :name_validations
  @@name_validations = true
  
  mattr_accessor :db_store
  @@db_store = true

  mattr_accessor :csv_store
  @@csv_store = true

  mattr_accessor :csv_file
  @@csv_file = 'subscribers.csv'

  mattr_accessor :mailer_sender
  @@mailer_sender = nil

  # Messages
  mattr_accessor :subscribed
  @@subscribed = 'Subscribed Successfully.'

  mattr_accessor :already_subscribed
  @@already_subscribed = 'Already Subscribed.'

  mattr_accessor :error_subscribed
  @@error_subscribed = 'Please Try to subscribe again.'

  # Default way to setup Sooner. Run rails generate sooner_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end

require 'sooner/rails'
