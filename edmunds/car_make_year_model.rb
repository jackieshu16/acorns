class CarMakeYearModel


  def initialize(make,year,model)
  @@make = make
  @@year = year
  @@model = model
  end
  
  def display
    puts "The rules are #{@@make} , #{@@year} , #{@@model} "
  end
 
  def make 
    @@make
  end
  def year 
    @@year
  end
  def model
    @@model
  end
end
