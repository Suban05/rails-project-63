# frozen_string_literal: true

require_relative "hexlet_code/version"

# hexlet code
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "hexlet_code/tag")

  def self.form_for(_object, options = {}, &block)
    action = options[:url] || "#"
    method = options[:method] || :post
    Tag.build("form", action:, method:, &block)
  end
end
