class HomePage
  def body
    home_page = File.read("./lib/templates/home_page.html.erb")
    ERB.new(home_page).result
  end

  def headers
    {}
  end

  def response
    [status_code, headers, [body]]
  end

  def status_code
    200
  end
end
