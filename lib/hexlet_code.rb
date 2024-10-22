# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/form_builder"

# Hexlet code
module HexletCode
  class Error < StandardError; end

  def self.form_for(object, options = {})
    action = options[:url] || "#"
    method = options[:method] || :post
    Tag.build("form", action:, method:) do
      yield(FormBuilder.new(object))
    end
  end
end
