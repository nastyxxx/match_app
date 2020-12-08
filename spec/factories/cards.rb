# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    card_token { 'tok_19cd928597e8e68c3da2b277bd51' }
    customer_token { 'cus_ca9d1d98900ec1f2595aebefd9a6' }
    association :user
  end
end
