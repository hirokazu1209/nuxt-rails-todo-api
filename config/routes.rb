Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :todos, only: [:index, :create, :destroy]
    resources :users, only: [:index, :create]
  end
end


# namespaceを使うとURLのHelperとPathに指定した文字がつく routeのURLにv1というPathが追加される