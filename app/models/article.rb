class Article < ApplicationRecord
  before_save :generate_slug, if: :new_record?

  private

  def generate_slug
    self.slug = self.title.downcase.gsub(" ", "-")
  end

  def new_record?
    new_record?
  end

  validates :title, presence: true
  validates :body, presence: true
end
