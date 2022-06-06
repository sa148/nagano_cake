Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :public do

  get '' => 'homes#top'
  get 'about' => 'homes#about'
  get 'customers' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
  post 'customers/edit' => 'customers#edit'
  patch 'customers/update' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  get 'customers/withdrawal' => 'customers#withdrawal'
  patch 'customers/withdrawal' => 'customers#withdrawal'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
    resources :delivers, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
    delete 'destory_all'
    end
    end
    resources :orders, only: [:new, :index, :show, :create]
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  root to: 'homes#top'
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:new, :create, :edit, :index, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
