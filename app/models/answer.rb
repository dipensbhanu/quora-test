class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  extend FriendlyId
  friendly_id :secure_slug, use: :slugged

  def secure_slug
  	@random_slug ||=persisted? ? friendly_id : "#{Time.now.to_i}-#{(0...10).map { ('a'..'z').to_a[rand(26)] }.join}"
  end
end
