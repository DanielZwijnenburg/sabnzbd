require 'httparty'
require 'sabnzbd/slot'

class Sabnzbd
  attr_accessor :api_key, :base_uri
  attr_reader :slots
  include HTTParty
  
  def initialize(args={})
    @api_key  = args[:api_key]  || (raise ApiKeyMissing.new, "Api key missing")
    @base_uri = args[:base_uri] || "localhost:8080"
    self.class.base_uri @base_uri
  end

  def simple_queue
    make_request
  end

  def paused?
    make_request["queue"]["paused"]
  end

  def slots
    @slots ||= initialize_slots
  end

  private

  def make_request(url = "/api?mode=queue&start=START&limit=LIMIT&output=json&apikey=#{@api_key}")
    verify_response( self.class.get(url).parsed_response )
  end

  def verify_response response
    raise ApiKeyInvalid.new, "Api key invalid #{@api_key}" if response["status"] == false && response["error"]

    response
  end

  def initialize_slots
    jobs = make_request["queue"]["slots"]

    jobs.each.inject([]) do |arr, job|
      arr << Sabnzbd::Slot.new(job)
    end
  end
end

class ApiKeyMissing < Exception;end
class ApiKeyInvalid < Exception;end