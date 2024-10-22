# frozen_string_literal: true

module HexletCode
  # Form item
  class FormItem
    attr_reader :type, :options
    attr_accessor :body

    def initialize(type, options)
      @type = type
      @options = options
    end
  end
end
