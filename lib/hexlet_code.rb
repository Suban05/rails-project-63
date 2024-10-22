# frozen_string_literal: true

require "active_support/inflector"
require_relative "hexlet_code/version"

# Hexlet code
module HexletCode
  class Error < StandardError; end

  autoload(:Tag, "./lib/hexlet_code/tag")
  autoload(:FormItem, "./lib/hexlet_code/form_item")
  autoload(:Form, "./lib/hexlet_code/form")
  autoload(:FormBuilder, "./lib/hexlet_code/form_builder")
  autoload(:HtmlRenderer, "./lib/hexlet_code/html_renderer")
  autoload(:FormRenderer, "./lib/hexlet_code/form_renderer")

  def self.form_for(object, options = {})
    form_builder = FormBuilder.new(object, options)
    yield(form_builder)
    FormRenderer.new(:html, form_builder.form).render
  end
end
