Rails.application.routes.draw do

  resources 'shortener', :only=>[:index,:create]

  get '/:hash_id', to: 'shortener#redirect'

  root to: 'shortener#index'

end
