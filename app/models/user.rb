class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers

  validates :name, presence: true

  extend FriendlyId
  friendly_id :secure_slug, use: :slugged

  acts_as_followable

  acts_as_follower

  def topics
    following_by_type('Topic')
  end

  def following
    following_by_type('User')
  end

  def secure_slug
    @random_slug ||=persisted? ? friendly_id : "#{Time.now.to_i}-#{name.parameterize}"
  end

end
