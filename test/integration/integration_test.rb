require "test_helper"

class IntegrationTest < ActionDispatch::IntegrationTest
  test "can create and update article" do
    ## ここはcreateのテスト

    # ポストリクエストを送りその回答が自動的(暗黙的に）responseに代入される
    post '/api/articles', params: { "article": { "title": "How to train your dragon", "body": "Very carefully." } }
    json_response = JSON.parse(response.body)
    assert_equal(json_response["article"]["slug"], "how-to-train-your-dragon")

    ## ここはupdateのテスト
    put '/api/articles/how-to-train-your-dragon', params: { "article": {"title": "Did you train your dragon?"}}
    json_response = JSON.parse(response.body)
    assert_equal(json_response["article"]["title"], "Did you train your dragon?")
  end

  # test "can create article" do
  #   ## ここはcreateのテスト
  #   # ポストリクエストを送りその回答が自動的(暗黙的に）responseに代入される
  #   post '/api/articles', params: { "article": { "title": "How to train your dragon", "body": "Very carefully." } }
  #   json_response = JSON.parse(response.body)
  #   assert_equal(json_response["article"]["slug"], "how-to-train-your-dragon")
  # end

  # test "can update article" do
  #   put '/api/articles/how-to-train-your-dragon', params: { "article": {"title": "Did you train your dragon?"}}
  #   json_response = JSON.parse(response.body)
  #   assert_equal(json_response["article"]["title"], "Did you train your dragon?")
  # end


end
