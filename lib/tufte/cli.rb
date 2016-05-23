require "optparse"

module Tufte
  module CLI
    def self.run(command)
      case command
      when "init"
        Tufte.init
      when "build"
        Tufte.build
      when "serve"
        require "rack"
        Rack::Server.start
      when "version", "-v", "--version"
        puts Tufte::VERSION
      else
        puts <<-USAGE
Usage: tufte [command]
Commands:
  init             Scaffold a new blog in the current directory
  build            Generate HTML pages based on the templates
  serve            Start a development server to host your files locally
  version          Print the current version
  help             Print this message
        USAGE
      end
    end
  end
end
