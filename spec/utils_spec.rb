require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
describe "Sabnzbd::Utils" do
  describe "Listing of download positions" do
    let(:sabnzbd) {Sabnzbd.new({base_uri: "localhost:8080", api_key: "valid_key"})}
    before do
      VCR.insert_cassette 'multiple slots downloading', :record => :new_episodes
    end

    it "should be able to list download positions" do
      sabnzbd.utils.slot_positions.should == {0 => "id_1", 1 => "id_2"}
    end

    after do
      VCR.eject_cassette
    end
  end


  describe "switching of download positions" do
    let(:sabnzbd) {Sabnzbd.new({base_uri: "localhost:8080", api_key: "valid_key"})}
    before do
      VCR.insert_cassette 'switch success', :record => :new_episodes
    end

    it "should be able to switch download positions" do
      first_slot = sabnzbd.slots.first 
      last_slot  = sabnzbd.slots.last
      sabnzbd.utils.switch(first_slot, last_slot)

      sabnzbd.utils.slot_positions.should == {0 => "id_2", 1 => "id_1"}
    end

    after do
      VCR.eject_cassette
    end
  end
end