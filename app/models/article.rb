class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }  

  def self.search(search_term)
    if Rails.env.production?
      Article.where("title ILIKE ? OR author ILIKE ?", "%#{search_term}%","%#{search_term}%")
    else
      Article.where("title LIKE ? OR author LIKE ?", "%#{search_term}%", "%#{search_term}%")
    end
  end
end

