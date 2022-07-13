class Comment < ActiveRecord::Base
  belongs_to :user, foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id
  validates :text, presence: true, length: { minimum: 3, maximum: 255 }
  after_save :update_comment_counter

  def update_comment_counter
    post.comments_counter = 0 if post.comments_counter.nil?
    post.increment!(:comments_counter)
  end
end
