require 'httparty'
require 'sabnzbd/slot'
require 'sabnzbd/utils'

class Sabnzbd
  attr_accessor :api_key, :base_uri
  attr_reader :slots, :utils
  include HTTParty
  
  def initialize(args={})
    @api_key  = args[:api_key]  || (raise ApiKeyMissing.new, "Api key missing")
    @base_uri = args[:base_uri] || "localhost:8080"
    self.class.base_uri @base_uri
    @utils    = Sabnzbd::Utils.new(self)
  end

  def advanced_queue
    make_request
  end

  def paused?
    make_request["queue"]["paused"]
  end

  def speed
    make_request["queue"]["speed"].strip
  end

  def slots(refresh=false)
    refresh ? @slots = initialize_slots : @slots ||= initialize_slots
  end

  def make_request(url = "/api?mode=queue&start=START&limit=LIMIT&output=json&apikey=#{@api_key}")
    verify_response( self.class.get(url).parsed_response )
  end

  private

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