require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: "hello", body: "how are you?")
  end
  
  test "title and body should not empty" do
    @article.title = "  "
    @article.body = ""
    assert_not @article.valid?
  end
end
