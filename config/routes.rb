Rails.application.routes.draw do |map|
  resources :subscribers, :controller => 'sooner/subscribers', :only => [:new, :create]
end
