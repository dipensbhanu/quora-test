class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :answers

  extend FriendlyId
  friendly_id :secure_slug, use: :slugged

  def secure_slug
    @random_slug ||=persisted? ? friendly_id : "#{Time.now.to_i}-#{title.parameterize}"
  end
end
