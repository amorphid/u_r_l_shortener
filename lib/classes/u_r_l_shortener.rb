class URLShortener
  def call(env)
    HomePage.new.response
  end
end
