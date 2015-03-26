class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  def published_on
    date = published_at.present? ? published_at : updated_at
    I18n.l(date, format: :readable_date)
  end
end
