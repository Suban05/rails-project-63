# frozen_string_literal: true

require "forwardable"

module HexletCode
  # Form renderer
  class FormRenderer
    extend Forwardable

    def initialize(type, form)
      @renderer = "HexletCode::#{type.capitalize}Renderer".constantize.new(form)
    end

    def_delegators :@renderer, :render
  end
end
