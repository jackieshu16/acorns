require './car_make_year_model.rb'
require 'json'

describe CarMakeYearModel do
  context "passing valid make, year, model" do
    ####create an instance of class CarMakeYearModel, it can be used by all examples 
    car = CarMakeYearModel.new("honda","2016","fit")

    it "should pass in the cutomized make, year, model" do
      puts "starting case 1"
     #car = CarMakeYearModel.new("honda","2016","fit")
      car.display
      expect(car.make).to eql "honda"
      expect(car.year).to eql "2016"
      expect(car.model).to eql "fit"

      puts "finish case 1"
    end

    it "should pass the url to the api and get json response" do
      puts "starting case 2"
     #car = CarMakeYearModel.new("honda","2016","fit")
      ###reference url is https://api.edmunds.com/api/vehicle/v2/honda/accord/2001?fmt=json&api_key="
      base_url="https://api.edmunds.com/api/vehicle/v2/"
      a_make=car.make
      a_year=car.year
      a_model=car.model
      fmt="fmt=json"
      api_key="api_key=bucp3bkpzv85eg9k2kmbkt8p"
      full_url="#{base_url}"+"#{a_make}"+"/"+"#{a_model}"+"/"+"#{a_year}"+"?"+"#{fmt}"+"&"+"#{api_key}"
      puts "#{full_url}"
      response = `curl #{full_url}`
      puts "the response saved is #{response}"

      puts "finish case 2"
    end

    it "should parse json response and validate the records met the rules" do
      puts "starting case 3: should parse json response and validate the records met the rules"
      ####create a function to be reused
      def parse_and_validate(resp)
        obj = JSON.parse(resp)
       #puts obj
        id_exist=obj.key?("id")
        status_exist=obj.key?("status")
        puts "id exist? #{id_exist}; status exist? #{status_exist}"
        if id_exist==true then
         #puts "id_exist is true"
          expect(obj["year"]).to match(2016)

          hash_sty = obj["styles"]
          hash_sty.each do |key|
            mdl = key["submodel"]["modelName"]
           #puts "#{mdl}"
            expect(mdl).to match(/Fit/) 
          end
        elsif status_exist==true
         #puts "status_exist is true"
          expect(obj["status"]).to eql "FORBIDDEN"
        end

      end #of parse_and_validate

      ####response with valid records
      resp = `cat json_response.txt`
     #puts "#{resp}"
      parse_and_validate(resp)

      ####response with failure
      resp = `cat json_response_fail.txt`
     #puts "#{resp}"
      parse_and_validate(resp)

      puts "finish case 3: should parse json response and validate the records met the rules"
 
    end

   
  end
end
