# frozen_string_literal: true

require 'active_support/inflector'
require_relative 'hexlet_code/version'

# Hexlet code
module HexletCode
  class Error < StandardError; end

  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:FormItem, 'hexlet_code/form_item.rb')
  autoload(:Form, 'hexlet_code/form.rb')
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:HtmlRenderer, 'hexlet_code/html_renderer.rb')
  autoload(:FormRenderer, 'hexlet_code/form_renderer.rb')

  def self.form_for(object, options = {})
    form_builder = FormBuilder.new(object, options)
    yield(form_builder) if block_given?
    FormRenderer.new(:html, form_builder.form).render
  end
end
