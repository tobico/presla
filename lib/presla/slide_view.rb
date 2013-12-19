module Presla
  class SlideView < Texty::Control
    attr :slide

    def initialize(options={})
      super
      @slide = options[:slide]
      @height = determine_height
    end

    def draw_to_region(x, y, w, h)
      cy = y
      slide.items.each do |item|
        begin
          case item
          when /^\#\s+.*$/
            heading = item.sub(/^#\s+/, '')
            screen.style(bold: true) do
              screen.put_str(x, cy, heading.center(w)[0, w])
            end
            screen.put_str(x, cy + 1, ('═' * [w, heading.length].min).center(w))
            cy += 1
          else
            screen.put_str x, cy, item[0, w]
          end
        rescue
          nil
        ensure
          cy += 1
        end
      end
    end

    def determine_height
      slide.items.inject(0) do |total, item|
        case item
        when /^\#\s+.*$/
          total + 2
        else
          total + 1
        end
      end
    end
  end
end
