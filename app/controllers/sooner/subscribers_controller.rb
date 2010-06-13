module Sooner
  class SubscribersController < ApplicationController
    
    unloadable
    
    def new
      @subscriber = Subscriber.new
    end

    def create
      @subscriber = Subscriber.new(params[:sooner_subscriber])
      if @subscriber.valid?
        if Sooner.csv_store
          @subscriber.save_csv
        end
        if Sooner.db_store
          @subscriber.save
        end
        render :update do |page|
          page.replace_html 'sooner_subscriber', Sooner.subscribed
        end
      elsif @subscriber.errors[:name].include?('has already been taken') || @subscriber.errors[:email].include?('has already been taken')
        render :update do |page|
          page.replace_html 'sooner_subscriber', Sooner.already_subscribed
        end
      else
        flash[:notice] = Sooner.error_subscribed
        redirect_to new_subscriber_path
      end
    end
  end
end
