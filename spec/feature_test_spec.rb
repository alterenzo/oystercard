require_relative '../lib/oystercard'

describe 'FEATURE TEST:' do
  it 'Tops up card' do
    my_card = Oystercard.new
    my_card.top_up(5)
  end

  it 'Touches in and then out' do
    my_card = Oystercard.new
    my_card.top_up(5)
    my_card.touch_in(Station.new("London Bridge", 1))
    my_card.touch_out(Station.new("Greenwich", 2))
  end

  # it 'Remembers the entry station when touches in' do
  #   my_card = Oystercard.new
  #   my_card.top_up(5)
  #   my_card.touch_in(:london_bridge)
  #   p @trips
  #   # p @trips[0]
  # end
end
