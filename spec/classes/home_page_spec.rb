require "spec_helper"

describe HomePage do
  let(:home_page) { HomePage.new }

  context "#body" do
    it "returns body" do
      body = home_page.body
      expect(body).to include("URL Shortener")
    end
  end

  context "#headers" do
    it "returns headers" do
      headers = home_page.headers
      expect(headers).to eq({})
    end
  end

  context "#response" do
    it "returns a response w/ status_code, headers, and body" do
      response = home_page.response
      expect(response).to eq([200, {}, "URL Shortener"])
    end
  end

  context "#status_code" do
    it "returns a status code" do
      status_code = home_page.status_code
      expect(status_code).to eq(200)
    end
  end
end
