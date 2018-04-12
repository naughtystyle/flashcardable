Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :decks, only: [:index, :show] do
        resources :cards, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
