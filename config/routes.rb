Rails.application.routes.draw do
  get 'quotes/index'
  root 'quotes#index'
end
