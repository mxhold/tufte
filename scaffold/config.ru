class DirectoryIndex
  def initialize(app)
    @app = app
  end

  def call(env)
    index_path = File.join(
      ".",
      Rack::Request.new(env).path.split('/'),
      "index.html"
    )

    if File.exists?(index_path)
      [200, {"Content-Type" => "text/html"}, [File.read(index_path)]]
    else
      @app.call(env)
    end
  end
end

use DirectoryIndex

run Rack::Directory.new(".")
