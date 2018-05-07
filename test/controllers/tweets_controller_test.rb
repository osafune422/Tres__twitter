require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new_tweet" do
    get tweets_new_tweet_url
    assert_response :success
  end

end
