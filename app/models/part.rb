class Part < ActiveRecord::Base
  def self.by_name
    order(:name)
  end

  def self.by_price
    order(:price)
  end
  
  def self.by_weight
    order(:weight)
  end
  
  def self.by_model
    order(:model)
  end

  def inflation(price)
    self.update(price: price)
  end

  def new_model(model)
    self.update(model: model)
  end

  def find_price_per_weight
   self.price / self.weight
  end

  def talk
    'Hablamos español. Sprechen Sie Deutsch?' 
  end
    
  def self_destruct
    'Goodbye, my friends.'
    self.update(name: nil, weight: nil, price: nil, model: nil)
  end

  def cartwheels
    self.update(name: self.name.reverse)
  end

  def smelt(weight)
    self.update(weight: weight)   
  end

end
