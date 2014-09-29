DealHunter::Application.routes.draw do

  get "sessions/create"

  get "sessions/destroy"

  get "home/show"

  resources :clients_companies


  resources :newsletter_frequencies

  match 'auth/:provider/callback', to:'session#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  match 'pages/work_with_us' => 'pages#work_with_us'
  match 'pages/form_company' => 'pages#form_company'
  match 'pages/faqs' => 'pages#faqs'
  match 'pages/contact' => 'pages#contact'
  match 'pages/form_contact' => 'pages#form_contact'
  match 'pages/contact_potential_advertiser' => 'pages#contact_potential_advertiser'
  match 'pages/contact_work_with_us' => 'pages#contact_work_with_us'
  match 'pages/contact_recommendation' => 'pages#contact_recommendation'
  match 'pages/we' => 'pages#we'
  match 'pages/terms_and_conds' => 'pages#terms_and_conds'
  match 'users/offers_company_user' => 'users#offers_company_user'
  match 'users/offers_client_user' => 'users#offers_client_user'
  match 'users/titles_user' => 'users#titles_user'
  match 'users/save_titles_user' => 'users#save_titles_user'
  match 'users/branches_company_user' => 'users#branches_company_user'
  match 'users/newsletter_freq' => 'users#change_newsletter_frequency'
  match 'users/home' => 'users#home'
  match 'users/home_view' => 'users#home_view'
  match 'users/home_map' => 'users#home_map'
  match 'users/inscribe' => 'users#inscribe'
  match 'users/unsubscribe' => 'users#unsubscribe'
  match 'send/newsletter' => 'pages#sendNewsletter'
  match 'send/endOfferMail' => 'pages#sendEndOfferMail'
  match 'send/recommendOfferMail' => 'pages#recommendOfferMail'

  match 'offers/results' => 'offers#results'
  match 'offers/save_results' => 'offers#save_results'

  match 'users/statistics' => 'users#statistics'

  root :to => "users#home"

  resources :countries

  resources :clients_offers

  resources :offers_titles

  resources :client_titles

  resources :titles

  resources :prizes

  resources :offers

  resources :branches

  resources :addresses

  # devise_for :users, :controllers => { :registrations => "registrations", :passwords => "passwords"}

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :clients

  resources :companies

  resources :user_roles

  resources :users

  resources :passwords


  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)


end
