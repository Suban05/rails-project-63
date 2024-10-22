# frozen_string_literal: true

module HexletCode
  # Form builder
  class FormBuilder
    def initialize(object)
      @object = object
      @html = []
    end

    def input(name, options = {})
      value = @object.public_send(name.to_sym)
      label(name, name.capitalize)
      if options[:as] == :text
        textarea(name, value, options)
      else
        add(Tag.build("input", { name:, type: options[:type] || :text, value: }.merge(options)))
      end
    end

    def submit(value = "Save", options = {})
      add(Tag.build("input", { type: :submit, value: }.merge(options)))
    end

    def label(input_name, body, options = {})
      add(Tag.build("label", { for: input_name }.merge(options)) { body })
    end

    def textarea(name, body, options = {})
      cols = options[:cols] || "20"
      rows = options[:rows] || "40"
      add(Tag.build("textarea", { name:, cols:, rows: }.merge(options.except(:as))) { body })
    end

    private

    def add(row)
      @html << row
      @html.join
    end
  end
end
