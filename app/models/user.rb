class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth auth
    User.find_or_initialize_by(email: auth.info.email).tap do |user|
      user.name = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.image = auth.info.image
      user.password = User.generate_unique_secure_token if user.new_record?
      user.save
    end
  end
end
