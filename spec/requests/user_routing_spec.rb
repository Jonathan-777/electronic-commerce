require 'rails_helper'

RSpec.describe 'User routes', type: :routing do
  # Sessions routes
  it 'routes GET /auth/sign_in to auth/sessions#new' do
    expect(get: '/auth/sign_in').to route_to('auth/sessions#new')
  end

  it 'routes POST /auth/sign_in to auth/sessions#create' do
    expect(post: '/auth/sign_in').to route_to('auth/sessions#create')
  end

  it 'routes DELETE /auth/sign_out to auth/sessions#destroy' do
    expect(delete: '/auth/sign_out').to route_to('auth/sessions#destroy')
  end

  # Password routes
  it 'routes GET /auth/password/new to devise/passwords#new' do
    expect(get: '/auth/password/new').to route_to('devise/passwords#new')
  end

  it 'routes GET /auth/password/edit to devise/passwords#edit' do
    expect(get: '/auth/password/edit').to route_to('devise/passwords#edit')
  end

  it 'routes PATCH /auth/password to devise/passwords#update' do
    expect(patch: '/auth/password').to route_to('devise/passwords#update')
  end

  it 'routes PUT /auth/password to devise/passwords#update' do
    expect(put: '/auth/password').to route_to('devise/passwords#update')
  end

  it 'routes POST /auth/password to devise/passwords#create' do
    expect(post: '/auth/password').to route_to('devise/passwords#create')
  end

  # Registration routes
  it 'routes GET /auth/cancel to auth/registrations#cancel' do
    expect(get: '/auth/cancel').to route_to('auth/registrations#cancel')
  end

  it 'routes GET /auth/edit to auth/registrations#edit' do
    expect(get: '/auth/edit').to route_to('auth/registrations#edit')
  end

  it 'routes PATCH /auth to auth/registrations#update' do
    expect(patch: '/auth').to route_to('auth/registrations#update')
  end

  it 'routes PUT /auth to auth/registrations#update' do
    expect(put: '/auth').to route_to('auth/registrations#update')
  end

  it 'routes DELETE /auth to auth/registrations#destroy' do
    expect(delete: '/auth').to route_to('auth/registrations#destroy')
  end

  it 'routes POST /auth to auth/registrations#create' do
    expect(post: '/auth').to route_to('auth/registrations#create')
  end
end
