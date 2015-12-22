require 'rails_helper'

RSpec.describe Part, type: :model do
  describe 'attributes' do
    it { should respond_to :name }
    it { should respond_to :price }
    it { should respond_to :weight }
    it { should respond_to :model}
  end

  describe 'class methods' do
    before (:each) do
      @part1 = Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      @part2 = Part.create(name: 'Computer', price: 100293848, weight: 4, model: 'Apple')
      @part3 = Part.create(name: 'Brake Shoe', price: 35, weight: 7, model:'Flipflop')
    end

    it 'sorts by name' do
      parts = Part.by_name
      expect(parts.first).to eq(@part3)
      expect(parts.second).to eq(@part2)
      expect(parts.last).to eq(@part1)
    end

    it 'sorts by price' do
      parts = Part.by_price
      expect(parts.first).to eq(@part3)
      expect(parts.second).to eq(@part1)
      expect(parts.last).to eq(@part2)
    end

    it 'sorts by weight' do
      parts = Part.by_weight
      expect(parts.first).to eq(@part2)
      expect(parts.second).to eq(@part3)
      expect(parts.last).to eq(@part1)
    end

    it 'sorts by model' do
      parts = Part.by_model
      expect(parts.first).to eq(@part2)
      expect(parts.second).to eq(@part3)
      expect(parts.last).to eq(@part1)
    end
  end

  describe 'instance methods' do
    it 'updates the price' do
      new_price = 59.99
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      part.inflation(new_price)
      expect(part.price).to eq(new_price)
    end

    it 'updates the model' do
      second_model = 'Harry Potter'
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      part.new_model(second_model)
      expect(part.model).to eq(second_model)
    end

    it 'finds price per weight' do
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      expect(part.find_price_per_weight).to eq(part.price/part.weight)
    end

    it 'talks' do
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      expect(part.talk).to eq('Hablamos español. Sprechen Sie Deutsch?')
    end

    it 'self destructs' do
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      part.self_destruct
      expect(part.name).to eq(nil)
      expect(part.price).to eq(nil)
      expect(part.weight).to eq(nil)
      expect(part.model).to eq(nil)
    end

    it 'cartwheels' do 
      current_name = 'Wheel'
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      part.cartwheels
      expect(part.name).to eq(current_name.reverse)
    end

    it 'smelt/ updates the weight' do
      new_weight = 15
      part =  Part.create(name: 'Wheel', price: 40, weight: 50, model: 'GoodYear')
      part.smelt(new_weight)
      expect(part.weight).to eq(new_weight)
    end
  end
end
