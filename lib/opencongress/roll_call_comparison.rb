module OpenCongress
  
  class OCRollCallComparison < OpenCongressObject
    
    attr_accessor :roll_call, :person1, :person2
    
    def initialize(params)
      params.each do |key, value|
        instance_variable_set("@#{key}", value) if OCRollCallComparison.instance_methods.include? key
      end
      
      
      set_people
      set_roll_call
            
    end

    def set_people
      self.person1 = self.person1["stong"]
      self.person2 = self.person2["stong"]
    end
    
    def set_roll_call
      
      self.roll_call = OCRollCall.new(self.roll_call)

    end


  end
    
end
