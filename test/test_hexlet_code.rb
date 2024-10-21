# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, keyword_init: true)
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generates_form_without_attributes
    user = @user.new name: "rob"
    form = HexletCode.form_for user do |f|
    end
    assert_equal("<form action=\"#\" method=\"post\"></form>", form)
  end

  def test_generates_form_with_url
    user = @user.new name: "rob"
    form = HexletCode.form_for user, url: "/users" do |f|
    end
    assert_equal("<form action=\"/users\" method=\"post\"></form>", form)
  end

  def test_generates_form_with_method
    user = @user.new name: "rob"
    form = HexletCode.form_for user, method: :get do |f|
    end
    assert_equal("<form action=\"#\" method=\"get\"></form>", form)
  end

  def test_generates_form_without_block
    user = @user.new name: "rob"
    form = HexletCode.form_for user, url: "/users"
    assert_equal("<form action=\"/users\" method=\"post\"></form>", form)
  end
end
