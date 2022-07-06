class Like < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
