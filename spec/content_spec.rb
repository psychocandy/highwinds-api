require 'rspec'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'highwinds-api'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'highwinds-api/content'))

describe 'HighwindsAPI::Content' do
  username = "<YouUserName>"
  password = "<YourPassword>"
  it "should not purge content, if username and password are not correct." do
    HighwindsAPI.set_credentials("bad username", "bad password")
    r = HighwindsAPI::Content.purge_url("http://staging.crossrider.com/kerker/", true).response
    r.code.should eq("403"), "response was: #{r}"
  end

  it "should purge content by url" do
    HighwindsAPI.set_credentials(username, password)
    r = HighwindsAPI::Content.purge_url("http://staging.crossrider.com/kerker/", true).response
    r.code.should eq("200"), "response was: #{r}"
  end

  it "should purge folder by path" do
    HighwindsAPI.set_credentials(username, password)
    r = HighwindsAPI::Content.purge_path("y2s9x4y9", "kerker/").response
    r.code.should eq("200"), "response was: #{r}"
  end

  it "should purge file by path" do
    HighwindsAPI.set_credentials(username, password)
    r = HighwindsAPI::Content.purge_path("y2s9x4y9", "kerker/akamai").response
    r.code.should eq("200"), "response was: #{r}"
  end

end