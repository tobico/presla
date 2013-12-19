require 'bundler'
Bundler.require

class App < Texty::Application
  def initialize(filename)
    window = Texty::Window.new(title: "Key watch")
    super window: window
    window.bind :key_press do |key|
      window.title = key.inspect
    end
  end
end

app = App.new ARGV.first
app.run
