# frozen_string_literal: true

module HexletCode
  # form builder
  class FormBuilder
    def initialize(object)
      @object = object
      @html = []
    end

    def input(name, options = {})
      value = @object.public_send(name.to_sym)
      if options[:as] == :text
        cols = options[:cols] || "20"
        rows = options[:rows] || "40"
        tag = Tag.build("textarea", { name:, cols:, rows: }.merge(options.except(:as))) { value }
      else
        tag = Tag.build("input", { name:, type: options[:type] || "text", value: }.merge(options))
      end
      add(tag)
    end

    private

    def add(row)
      @html << row
      @html.join
    end
  end
end
