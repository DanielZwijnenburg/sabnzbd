class Sabnzbd
  class Slot
    attr_accessor :filename, :average_age, :status, :category, :files_missing, 
                  :position, :priority, :percentage_completed, :time_left, :eta, 
                  :size, :size_left, :mb, :mb_left, :msgid, :nzo_id

    def initialize(args={})
      @filename               = args["filename"]    || "No filename"
      @average_age            = args["avg_age"]     || "-"
      @status                 = args["status"]      || "No status"
      @category               = args["cat"]         || "-"
      @files_missing          = args["missing"]     || 0
      @position               = args["index"]       || 0
      @priority               = args["priority"]    || "-"
      @percentage_completed   = args["percentage"]  ||  
      @time_left              = args["timeleft"]    || Time.now
      @eta                    = args["eta"]         || "-"
      @size                   = args["size"]        || "-"
      @size_left              = args["sizeleft"]    || "-"
      @mb                     = args["mb"]          || 0.00
      @mb_left                = args["mbleft"]      || 0.00
      @msgid                  = args["msgid"]       || nil
      @nzo_id                 = args["nzo_id"]      || "-"
    end
  end
end