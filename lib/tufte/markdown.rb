require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

module Tufte
  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def self.renderer
      @renderer ||= Redcarpet::Markdown.new(self, fenced_code_blocks: true)
    end
  end

  class Markdown
    def initialize(markdown, renderer: HTML.renderer)
      @markdown = markdown
      @renderer = renderer
    end

    def to_html
      @renderer.render(@markdown)
    end
  end
end
