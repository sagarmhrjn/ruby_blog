require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "sagar", email: "sagar.maharjan@example.com", password: "password", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    # assert the template
    assert_template 'categories/new'
    # there should be category count of 1 after we do this action
    assert_difference 'Category.count', 1 do
        post categories_path, params: {category:{name:"Sports"}}
        assert_response :redirect
        follow_redirect!
    end
    # send to index page
    assert_template 'categories/index'
    # ensure categor name is displayed
    assert_match "Sports", response.body
  end

  test "invalid category submission results in failure" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category:{name:" "}}
    end
    assert_template 'categories/new'
    assert_select "h5.card-title"
    assert_select "ul.card-text"
  end

end