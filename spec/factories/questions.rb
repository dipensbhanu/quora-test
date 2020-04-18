require 'faker'

FactoryBot.define do
  factory :question do |f|
  	f.title									{ Faker::Lorem.question }
  	user
  	topic
  end
end