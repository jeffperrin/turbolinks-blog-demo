class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 250 }
  validates :body, presence: true

  has_many :comments, dependent: :delete_all

  def published_on
    date = published_at.present? ? published_at : updated_at
    I18n.l(date, format: :readable_date)
  end
end
