require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'json'

module OpenCongress
  OC_BASE = "http://localhost:3000/"#www.opencongress.org/"
  API_URL = "#{OC_BASE}api/"
  
  attr_accessor :api_key
  
  class OpenCongressObject
    
    def self.construct_url(api_method, params)
      url = nil
      if OpenCongress.api_key == nil || OpenCongress.api_key == ''
        raise "Failed to provide OpenCongress API Key"
      else
        url = "#{API_URL}#{api_method}?key=#{OpenCongress.api_key}#{hash2get(params)}&format=json"
      end
      return url
    end
    
    def self.hash2get(h)
      get_string = ""
      
      h.each_pair do |key, value|
        get_string += "&#{key.to_s}=#{CGI::escape(value.to_s)}"
      end
      
      get_string
    end

    def self.parse_supporting_results(result)
      
      working = result["opencongress_users_tracking"]
      
      also_supporting_bills = []
      working["also_supporting_bills"]["bill"].each do |bill|
        also_supporting_bills << OCBill.new(bill)
      end
      
      also_opposing_bills = []
      working["also_opposing_bills"]["bill"].each do |bill|
        also_opposing_bills << OCBill.new(bill)
      end
      
      also_disapproved_senators = []
      working["also_disapproved_senators"]["person"].each do |person|
        also_disapproved_senators << OCPerson.new(person)
      end
      
      also_disapproved_representatives = []
      working["also_disapproved_representatives"]["person"].each do |person|
        also_disapproved_representatives << OCPerson.new(person)
      end

      also_approved_senators = []
      working["also_approved_senators"]["person"].each do |person|
        also_approved_senators << OCPerson.new(person)
      end
      
      also_approved_representatives = []
      working["also_approved_representatives"]["person"].each do |person|
        also_approved_representatives << OCPerson.new(person)
      end
      
      return {:also_supporting_bills => also_supporting_bills,
              :also_opposing_bills => also_opposing_bills,
              :also_disapproved_senators => also_disapproved_senators,
              :also_disapproved_representatives => also_disapproved_representatives,
              :also_approved_senators => also_approved_senators,
              :also_approved_representatives => also_approved_representatives}
      
    end
    
    def self.make_call(this_url)
      result = nil
      begin
        result = JSON.parse(open(this_url).read)
      rescue => e
        puts e
      end
      
      return result
      
    end
  end
  
end

Dir["#{File.dirname(__FILE__)}/opencongress/*.rb"].each {|source_file| require source_file}
