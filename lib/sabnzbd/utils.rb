class Sabnzbd
  class Utils
    attr_accessor :sabnzbd

    def initialize (parent)
      @sabnzbd = parent
    end

    def slot_positions
      return_hash = {}
      sabnzbd.slots(true).each do |s|
        return_hash[s.position] = s.nzo_id
      end

      return_hash
    end

    def switch(slot_a, slot_b)
      sabnzbd.make_request("/api?mode=switch&value=#{slot_a.nzo_id}&value2=#{slot_b.nzo_id}&apikey=#{sabnzbd.api_key}")
    end
  end
end