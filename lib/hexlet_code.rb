# frozen_string_literal: true

require_relative "hexlet_code/version"

# hexlet code
module HexletCode
  autoload(:Tag, "hexlet_code/tag.rb")
  autoload(:FormBuilder, "hexlet_code/form_builder.rb")
  class Error < StandardError; end

  def self.form_for(object, options = {})
    action = options[:url] || "#"
    method = options[:method] || :post
    Tag.build("form", action:, method:) do
      yield(FormBuilder.new(object))
    end
  end
end
