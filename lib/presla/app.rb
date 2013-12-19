module Presla
  class App < Texty::Application
    def initialize(filename)
      slide_deck = SlideDeck.load(filename)
      super window: Texty::Window.new(title: "#{File.basename filename} - Presla")
      slide_deck_view = SlideDeckView.new(slide_deck: slide_deck)
      window.add_child slide_deck_view
    end
  end
end
