require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'json'

module OpenCongress
  API_URL = "http://www.opencongress.org/api"
  
  attr_accessor = :api_key
  
  class OpenCongressObject
    
    def self.construct_url(api_method, params)
      if OpenCongress.api_key.blank?
        raise "Failed to provide OpenCongress API Key"
      else
        "#{API_URL}#{api_method}?key=#{OpenCongress.api_key}#{hash2get(params)}&format=json"
      end
    end
    
    def self.hash2get(h)
      get_string = ""
      
      h.each_pair do |key, value|
        get_string += "&#{key.to_s}=#{CGI::escape(value.to_s)}"
      end
      
      get_string
    end
    
    def make_call(url)
      result = nil
      begin
        result = JSON.parse(open(url).read)
      rescue
      end
      
      return doc
      
    end
  end
  
end

Dir["#{File.dirname(__FILE__)}/opencongress/*.rb"].each {|source_file| require source_file}