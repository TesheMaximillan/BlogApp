class Post < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  has_many :likes
  has_many :comments

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def most_recent_five_comments
    comments.order!(created_at: :desc).limit(5)
  end
end
