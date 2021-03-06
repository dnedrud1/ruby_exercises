require_relative '../enumerable_methods'

describe Enumerable do
  
  describe 'different possible inputs' do
    
    it "returns correctly when object is present" do
      a = [-1,3,55,55,55,70245,21,400,-7].my_any? { |i| i == 21 }
      expect(a).to eql true
    end
    
    it "returns correctly when multiple objects present" do
      a = [-1,3,55,55,55,70245,21,400,-7].my_any? { |i| i == 55 }
      expect(a).to eql true
    end
    
    it "returns correctly when object not present" do
      a = [-1,3,55,55,55,70245,21,400,-7].my_any? { |i| i == 30 }
      expect(a).to eql false
    end
    
    it "can handle arrays with multiple object types" do
      a = [true,55,"SomeText","",nil].my_any? { |i| i.to_s == i }
      expect(a).to eql true
    end
    
    it "can handle empty arrays" do
      a = [].my_any? { |i| i.class == String }
      expect(a).to eql false
    end
    
    it "can handle complex conditionals" do
      a = [-1,3,55,55,55,70245,21,400,-7].my_any? { |i| (i % 11 == 1 || i**2 == 3025) && i.to_s != "SomeText" }
      expect(a).to eql true
    end
    
  end
  
  describe "different possible errors" do
  
    it "raises LocalJumpError when block not provided" do
      expect{ [-1,3,55,55,55,70245,21,400,-7].my_any? }.to raise_error LocalJumpError
    end
    
    it "raises NoMethodError when object not an array" do
      expect{ "string".my_any? { |i| i == 1 } }.to raise_error NoMethodError
    end
    
  end
  
end
