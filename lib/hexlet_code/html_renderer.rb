# frozen_string_literal: true

module HexletCode
  # HTML renderer
  class HtmlRenderer
    def initialize(form)
      @form = form
      @html = []
    end

    def render
      append_items
      Tag.build('form', @form.options) do
        @html.join
      end
    end

    private

    def append_items
      @form.items.each do |item|
        tag = if item.body.nil?
                Tag.build(item.type, item.options)
              else
                Tag.build(item.type, item.options) { item.body.options[:content] }
              end
        append(tag)
      end
    end

    def append(row)
      @html << row
    end
  end
end
