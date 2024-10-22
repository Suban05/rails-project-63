# frozen_string_literal: true

require_relative "hexlet_code/version"

# Hexlet code
module HexletCode
  class Error < StandardError; end

  autoload(:Tag, "./lib/hexlet_code/tag")
  autoload(:FormBuilder, "./lib/hexlet_code/form_builder")

  def self.form_for(object, options = {})
    action = options[:url] || "#"
    method = options[:method] || :post
    Tag.build("form", action:, method:) do
      yield(FormBuilder.new(object))
    end
  end
end
