
module OpenCongress
  
  class Person < OpenCongressObject
    
    attr_accessor :firstname, :lastname, :bioguideid, :birthday, :district, :email, :gender, :id, :metavid_id, :middlename,
                  :name, :nickname, :osid, :party, :religion, :state, :title, :unaccented_name, :url, :user_approval,
                  :youtube_id, :oc_user_comments, :oc_users_tracking, :abstains_percentage, :with_party_percentage, :recent_news,
                  :recent_blogs, :person_stats
    
    
    def initialize
      params.each do |key, value|
        instance_variable_set("@#{key}", value) if Person.instance_methods.include? key
      end      
    end
    
    def all_where(params)
      
      url = construct_url("people", params)

      people = []
      result.each do |person|
        people << Person.new(person)
      end
      
      people

    end      
      
      
  end
  
end