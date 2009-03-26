module OpenCongress
  
  class OCVotingComparison < OpenCongressObject
    
    attr_accessor :total_votes, :same_vote, :percentage, :person1, :person2, :shared_committees, :hot_votes,
                  :other_votes
    
    def initialize(params)
      params.each do |key, value|
        instance_variable_set("@#{key}", value) if OCVotingComparison.instance_methods.include? key
      end
        
      set_people
      set_votes
            
    end    
    
    
    def set_people
      self.person1 = OCPerson.new(self.person1["person"])
      self.person2 = OCPerson.new(self.person2["person"])
    end
    
    def set_votes
      
      these_hot_votes = []
      hot_votes["vote"].each do |v|    
        nv = OCRollCallComparison.new(v)
        these_hot_votes << nv
      end
      
      self.hot_votes = these_hot_votes
      
      these_other_votes = []
      other_votes["vote"].each do |v|
        nv = OCRollCallComparison.new(v)
        these_other_votes << nv
      end
      
      self.other_votes = these_other_votes
      
    end
    
      
   
   
  end
end
