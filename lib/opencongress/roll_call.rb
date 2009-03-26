module OpenCongress
  
  class OCRollCall < OpenCongressObject
    
    attr_accessor :abstains, :presents, :roll_type, :title, :question, :republican_position, :democratic_position,
                  :amendment_id, :ayes, :nays, :bill, :date, :number, :id, :required, :where
    
    def initialize(params)
      params.each do |key, value|
        instance_variable_set("@#{key}", value) if OCRollCall.instance_methods.include? key
      end      
    end    
   
   
   
  end
end
