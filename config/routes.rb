Rails.application.routes.draw do
  resources 'shortener', :only=>[:index,:create]

  root to: 'shortener#index'
end
