Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :public do

  get 'homes' => 'homes#top'
  get 'about' => 'homes#about'
  get 'customers' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  get 'customers/withdrawal' => 'customers#withdrawal'

    resources :delivers, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  root to: 'homes#top'
    get 'items/show' => 'items#show'
    get 'items/update' => 'items#update'
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:new, :create, :edit, :index, :show]
    resources :genres, only: [:index, :create, :update, :edit]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
