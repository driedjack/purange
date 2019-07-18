# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    name { 'admin' }
    password_digest { 'admin' }
  end
end
