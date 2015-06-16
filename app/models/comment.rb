class Comment < ActiveRecord::Base
  validates :commenter_name, presence: true
  validates :body, presence: true

  belongs_to :post
end
