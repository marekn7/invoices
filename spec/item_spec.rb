require './model/item.rb'

RSpec.describe Item do
  describe ' #== ' do
    it 'true if items id are the same' do
      item_1 = Item.new('Book', 'Rails')
      item_1.item_id = 1
      item_2 = Item.new('Book', 'Rails')
      item_2.item_id = 1

      expect(item_1 == item_2).to eq true
    end

    it 'false if items id are diferent' do
      item_1 = Item.new('Book', 'Rails')
      item_1.item_id = 5
      item_2 = Item.new('Book', 'Rails')
      item_2.item_id = 5

      expect(item_1 == item_2).to eq false
    end
  end
end
