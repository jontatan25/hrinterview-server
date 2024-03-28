require "test_helper"

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get experiences_url, as: :json
    assert_response :success
  end

  test "should create experience" do
    assert_difference("Experience.count") do
      post experiences_url, params: { experience: { candidate_id: @experience.candidate_id, title: @experience.title, users_id: @experience.users_id, year: @experience.year } }, as: :json
    end

    assert_response :created
  end

  test "should show experience" do
    get experience_url(@experience), as: :json
    assert_response :success
  end

  test "should update experience" do
    patch experience_url(@experience), params: { experience: { candidate_id: @experience.candidate_id, title: @experience.title, users_id: @experience.users_id, year: @experience.year } }, as: :json
    assert_response :success
  end

  test "should destroy experience" do
    assert_difference("Experience.count", -1) do
      delete experience_url(@experience), as: :json
    end

    assert_response :no_content
  end
end
