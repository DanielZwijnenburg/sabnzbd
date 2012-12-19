class Sabnzbd
  class Slot
    attr_accessor :time_left, :mb, :msgid, :filename, :mb_left, :id

    def initialize(args={})
      @time_left  = args["timeleft"]  || Time.now
      @mb         = args["mb"]        || 0.00
      @msgid      = args["msgid"]     || nil
      @filename   = args["filename"]  || "No filename"
      @mb_left    = args["mbleft"]    || 0.00
      @id         = args["id"]        || "-"
    end
  end
end