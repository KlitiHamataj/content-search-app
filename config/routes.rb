Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles, except: :destroy
  get '/:id' => "shortener/shortened_urls#show"
end
