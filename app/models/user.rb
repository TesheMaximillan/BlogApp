class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :posts, foreign_key: :author_id
  has_many :likes
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def most_recent_three_posts
    posts.order!(created_at: :desc).limit(3)
  end
end
