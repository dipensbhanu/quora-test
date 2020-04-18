require 'faker'

FactoryBot.define do
  factory :answer do |f|
  	f.body									{ Faker::Lorem.paragraph }
  	user
  	question
  end
end