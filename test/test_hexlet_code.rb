# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, keyword_init: true)
    @fixture = load_fixture(:hexlet_code)
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generates_form_without_attributes
    user = @user.new name: 'rob'
    form = HexletCode.form_for user
    assert_equal('<form action="#" method="post"></form>', form)
  end

  def test_generates_form_with_url
    user = @user.new name: 'rob'
    form = HexletCode.form_for user, url: '/users'
    assert_equal('<form action="/users" method="post"></form>', form)
  end

  def test_generates_form_with_method
    user = @user.new name: 'rob'
    form = HexletCode.form_for user, method: :get
    assert_equal('<form action="#" method="get"></form>', form)
  end

  def test_generates_form_fields
    user = @user.new name: 'rob', job: 'hexlet'
    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal(@fixture['form_fields'], form)
  end

  def test_generates_form_fields_with_additional_attributes
    user = @user.new name: 'rob', job: 'hexlet'
    form = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal(@fixture['form_fields_with_additional_attrs'], form)
  end

  def test_overrides_default_attributes
    user = @user.new name: 'rob', job: 'hexlet'
    form = HexletCode.form_for user do |f|
      f.input :job, as: :text, cols: 50, rows: 55
    end
    assert_equal(@fixture['default_attributes'], form)
  end

  def test_error_when_object_field_does_not_exist
    user = @user.new name: 'rob', job: 'hexlet'
    assert_raises NoMethodError do
      HexletCode.form_for user do |f|
        f.input :age
      end
    end
  end

  def test_generates_form_with_submit
    user = @user.new job: 'hexlet'
    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal(@fixture['form_with_submit'], form)
  end

  def test_generates_form_with_custom_submit
    user = @user.new job: 'hexlet'
    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow', class: 'btn'
    end
    assert_equal(@fixture['form_with_custom_submit'], form)
  end
end
