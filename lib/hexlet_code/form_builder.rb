# frozen_string_literal: true

module HexletCode
  # Form builder
  class FormBuilder
    attr_reader :form

    def initialize(object, options = {})
      @object = object
      @options = options
      @form = Form.new(options)
    end

    def input(name, options = {})
      value = @object.public_send(name.to_sym)
      label(name, name.capitalize)
      if options[:as] == :text
        textarea(name, value, options)
      else
        form.append_item(:input, { name:, type: options[:type] || :text, value: }.merge(options))
      end
    end

    def submit(value = "Save", options = {})
      form.append_item(:input, { type: :submit, value: }.merge(options))
    end

    def label(input_name, body)
      item = form.append_item(:label, { for: input_name })
      item.body = FormItem.new(:plain_text, { content: body })
    end

    def textarea(name, body, options = {})
      cols = options[:cols] || 20
      rows = options[:rows] || 40
      item = form.append_item(:textarea, { name:, cols:, rows: }.merge(options.except(:as)))
      item.body = FormItem.new(:plain_text, { content: body })
    end
  end
end
