module Presla
  class SlideDeckView < Texty::Container
    attr :slide_deck, :slide_index
    
    def initialize(options={})
      super
      @slide_deck = options[:slide_deck]
      self.slide_index = 0
    end

    def accepts_focus?
      true
    end

    def draw
      children.first.left = children.first.right = (screen.width - 80) / 2
      children.first.top = (screen.height - children.first.height) / 2
      super
    end

    def current_slide
      slide_deck.slides[slide_index]
    end

    def slide_index=(index)
      @slide_index = index
      display_slide
    end

    def display_slide
      children.clear
      add_child SlideView.new(slide: current_slide)
    end

    def next_slide
      self.slide_index += 1 unless slide_index >= slide_deck.slides.count - 1
    end

    def previous_slide
      self.slide_index -= 1 unless slide_index <= 0
    end

    def key_press(key)
      case key
      when 'q'
        exit 
      when 'n', :escape_C
        next_slide
      when 'p', :escape_D
        previous_slide
      end
    end
  end
end
