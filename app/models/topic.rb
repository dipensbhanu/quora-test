class Topic < ApplicationRecord
  has_many :questions

  extend FriendlyId
  friendly_id :secure_slug, use: :slugged

  acts_as_followable

  def secure_slug
    @random_slug ||=persisted? ? friendly_id : "#{Time.now.to_i}-#{name.parameterize}"
  end

end
