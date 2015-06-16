class Comment < ActiveRecord::Base
  validates :commenter_name, presence: true, length: { maximum: 250 }
  validates :body, presence: true, length: { maximum: 1000 }

  belongs_to :post
end
