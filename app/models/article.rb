class Article < ApplicationRecord
  before_save :generate_slug, if: :new_record_or_title_changed?

  private

  def generate_slug
    self.slug = self.title.downcase.gsub(" ", "-")
  end

  def new_record_or_title_changed?
    new_record? || title_changed?
  end

  validates :title, presence: true
  validates :body, presence: true
end
