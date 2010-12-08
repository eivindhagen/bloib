# site_probe has methods to probe the url of another site (or itself)
require 'net/http'
require 'net/https'

def site_probe_auto(uri)
  
  uri_obj = URI.parse(uri)
  
  # GET request -> so the host can set his cookies
  if ["http", "https"].include? uri_obj.scheme
    puts "probing scheme:#{uri_obj.scheme} #{uri_obj.host} port:#{uri_obj.port} path:#{uri_obj.path}"
    http = Net::HTTP.new(uri_obj.host, uri_obj.port)
    if uri_obj.scheme == "https"
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    resp, data = http.get uri_obj.path
    
    puts "resp: #{resp}"
    #puts "data: #{data}"
    if resp
      cookie = resp.response['set-cookie']
      puts "cookie #{cookie}" if cookie
    end
  end

#  # POST request -> logging in
#  data = 'serwis=wp.pl&url=profil.html&tryLogin=1&countTest=1&logowaniessl=1&login_username=blah&login_password=blah'
#  headers = {
#    'Cookie' => cookie,
#    'Referer' => 'http://profil.wp.pl/login.html',
#    'Content-Type' => 'application/x-www-form-urlencoded'
#  }
#  
#  resp, data = http.post(path, data, headers)
#  
#  
#  # Output on the screen -> we should get either a 302 redirect (after a successful login) or an error page
#  puts 'Code = ' + resp.code
#  puts 'Message = ' + resp.message
#  resp.each {|key, val| puts key + ' = ' + val}
#  puts data
end

def site_probe(uri)
  return if uri.empty?

  return site_probe_auto(uri)

  # determine protocol
  
  # test http://hostname[:port]/path
  http_regexp = %r{
   (?<protocol> [hH][tT][tT][pP]:// ){0}
   (?<host> [^/]* ){0}
   (?<port> [\d]{1,5} ){0}
   (?<path> [^\s]* ){0}
 
   \g<protocol>\g<host>(:\g<port>)?\g<path>
 }x

  match = uri.match http_regexp
  if match and match.size >= 3
    host = match[:host]
    port = match[:port]
    path = match[:path] || '/'
    if port
      puts "matched http://#{host}:#{port}#{path}"
    else
      port = 80
      puts "matched http://#{host}#{path}"
    end
    site_probe_html(host, port, path)
  else
    puts "no match: '#{url}'"
  end
end


if __FILE__ == $0
  site_probe("http://bloib.com/")
  site_probe("http://bloib.com:80/")
  site_probe("https://bloib.com/")
  site_probe("http://localhost:3000/")
end