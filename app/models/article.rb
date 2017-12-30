class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }  

  def self.search(search_term)
    if Rails.env.production?
      Article.where("title ILIKE ?", "%#{search_term}%")
    else
      Article.where("title LIKE ?", "%#{search_term}%")
    end
  end
end

