module Presla
  class SlideDeck
    def self.load(filename)
      lines = File.readlines filename
      slides = lines.join('').split('!SLIDE').map{|data| data.sub(/^\n+/, '').split("\n")}
      new slides
    end

    attr :slides

    def initialize(slide_data)
      @slides = slide_data.map{|data| Slide.new(data)}
    end
  end
end
