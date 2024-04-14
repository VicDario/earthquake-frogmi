require 'uri'
require 'net/http'
require 'json'

class HttpClient
  def self.get(url)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'

    request = Net::HTTP::Get.new(uri)
    response = http.request(request)

    return parse_response(response)
  rescue StandardError => e
    { error: "Error: #{e.message}" }
  end

  def self.parse_response(response)
    case response
    when Net::HTTPSuccess
      return JSON.parse(response.body)
    else
      { error: "Error: #{response.code} #{response.message}" }
    end
  end
end