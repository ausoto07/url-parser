class UrlParser
  attr_accessor :new_url
  def initialize(new_url)
    @new_url = new_url
  end

  def scheme
    @new_url.split(":")[0]
  end
  def domain
    @new_url.split(":")[1].split("/")[2]
  end
  def port
    a = @new_url.split('com:').last.split("/")[0]
    if a == "http:"
      return "80"
    elsif a == "https:"
      return "443"
    end
    return a
  end
  def path
    x = @new_url.split('/')[3].split('?')[0]
    if x == ""
      return NIL
    end
    return x
  end
  def query_string
    query_string = @new_url.split('?').last.split('#i').first.split("&")
    happy = {}
    query_string.each do |str|
      arr = str.split("=")
      happy[arr.first] = arr.last
    end
    return happy
  end
  def fragment_id
    fragment_id = @new_url.split('#')[1]
  end

end
# new_url = UrlParser.new("http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat")
