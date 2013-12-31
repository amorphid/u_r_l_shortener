class HomePage
  def body
    "URL Shortener"
  end

  def headers
    {}
  end

  def response
    [status_code, headers, body]
  end

  def status_code
    200
  end
end
