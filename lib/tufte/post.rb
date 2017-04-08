require "yaml"

module Tufte
  class Post
    attr_reader :title, :slug

    def initialize(date:, title:, slug:, raw_body:)
      @date = date
      @slug = slug
      @title = title
      @raw_body = raw_body
    end

    def body
      rendered_erb = Tufte.render(@raw_body, :@post => self)
      Markdown.new(rendered_erb).to_html
    end

    def date
      @date.strftime("%Y %b %-d")
    end

    def output_directory
      File.join(@date.year.to_s, @date.month.to_s, @date.day.to_s, slug)
    end

    def output_filename
      File.join(output_directory, "index.html")
    end

    def self.load(filename)
      file_contents = File.read(filename)
      metadata = YAML.load(file_contents)

      new(
        date: metadata.fetch("date"),
        title: metadata.fetch("title"),
        slug: File.basename(filename, ".yml"),
        raw_body: file_contents.split("---\n", 3).last,
      )
    end
  end
end
