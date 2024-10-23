# frozen_string_literal: true

module HexletCode
  # HTML renderer
  class HtmlRenderer
    def initialize(form)
      @form = form
    end

    def render
      Tag.build('form', @form.options) do
        @form.items.map do |item|
          if item.body.nil?
            Tag.build(item.type, item.options)
          else
            Tag.build(item.type, item.options) { item.body.options[:content] }
          end
        end.join
      end
    end
  end
end
