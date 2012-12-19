require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
Base_uri = nil

describe "Sabnzbd" do
  describe "Creation of valid Sabnzbd instance" do
    before do
      VCR.insert_cassette 'valid key'
    end

    let(:sabnzbd) {Sabnzbd.new({api_key: "valid_key"})}
    it "creates a valid instance of Sabnzb" do
      sabnzbd.should be_an_instance_of(Sabnzbd)
    end

    it "Defaults the base_uri to localhost:8080" do
      sabnzbd.base_uri.should == "localhost:8080"
    end

    it "Allows the base_uri to be overwritten to localhost:8081" do
      Sabnzbd.new({api_key: "valid_key", base_uri: "localhost:8081"}).base_uri.should == "localhost:8081"
    end

    after do
      VCR.eject_cassette
    end
  end

  describe "Raising of errors" do
    it "should raise error if api key is missing" do
      expect { Sabnzbd.new() }.to raise_error(ApiKeyMissing)
    end
  end

  describe "GET API without valid key" do
    let(:sabnzbd) {Sabnzbd.new({base_uri: Base_uri, api_key: "invalid"})}
    before do
      VCR.insert_cassette 'invalid key'
    end

    it "should raise an error" do 
      expect {sabnzbd.simple_queue}.to raise_error(ApiKeyInvalid)
    end

    after do
      VCR.eject_cassette
    end
  end

  describe "GET statusses output" do
    let(:sabnzbd) {Sabnzbd.new({base_uri: Base_uri, api_key: "valid_key"})}
    before do
      VCR.insert_cassette 'paused', :record => :new_episodes
    end

    it "should be paused" do 
      sabnzbd.paused?.should eq true
    end

    it "should have 1 slot" do 
      sabnzbd.slots.size.should == 1
    end

    after do
      VCR.eject_cassette
    end
  end

  describe "GET simple Queue output" do
    let(:sabnzbd) {Sabnzbd.new({base_uri: Base_uri, api_key: "valid_key"})}
    before do
      VCR.insert_cassette 'simple queue', :record => :new_episodes
    end

    it "should get the simple queue" do 
      sabnzbd.simple_queue.should be_an_instance_of(Hash)
    end

    after do
      VCR.eject_cassette
    end
  end

  describe "GET slots output" do
    let(:sabnzbd) {Sabnzbd.new({base_uri: Base_uri, api_key: "valid_key"})}
    before do
      VCR.insert_cassette 'slots', :record => :new_episodes
    end

    it "should have 1 slot that is downloading a_big_legal_file" do 
     sabnzbd.slots.first.filename.should == "a_big_legal_file"
   end

    after do
      VCR.eject_cassette
    end
  end

end