require 'net/http'
require 'json'
class PasswordManagerProRestClient

  def initialize(server, apikey, port = 7272, enableinsecuressl = false)
    @server = server
    @apikey = apikey
    @port = port
    @baseserveruri = "https://" + server + ":" + port + "/restapi/json/v1/"
    @enableinsecuressl = enableinsecuressl
  end

  def self.get(uristring)
    fulluri = "https://#{@baseserveruri}:#{@port}/restapi/json/v1/#{uristring}&AUTHTOKEN=#{@apikey}"
    uri = URI.parse(uristring)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    if(@enableinsecuressl)
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
    end
    returnval = http.get(uri.request_uri).body
    jsonval = JSON.parse(returnval)
    if(jsonval["operation"]["result"]["status"] == "Success")
      return jsonval["operation"]["Details"]
    end
    throw :failure
  end

  def self.getresource(resourceid)
    if(resourceid.nil?)
    #Get All Resouces
      methodUri = "resources?"
    else
    #Get the specific Resource
      methodUri = "resources/#{resourceid}?"
    end
    return self.get(methodUri)
  end

  def self.getresourceaccount(resourceid, accountid)
    if(accountid.nil?)
      #Get All Resouces
      methodUri = "resources/#{resourceid}/accounts?"
    else
      #Get the specific Resource
      methodUri = "resources/#{resourceid}/accounts/#{accountid}?"
    end
    return self.get(methodUri)
  end

  def self.getresourceaccountpassword(resourceid, accountid)
    if(resourceid.is_a? Integer and accountid.is_a? Integer)
      #Get All Resouces
      methodUri = "resources/#{resourceid}/accounts?"
    else
      #Get the specific Resource
      methodUri = "resources/#{resourceid}/accounts/#{accountid}?"
    end
    return self.get(methodUri)
  end

  def self.getresourceid
    if(resourceid.nil?)
      #Get All Resouces
      methodUri = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
      #Get the specific Resource
      methodUri = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(methodUri))
    return resp.body
  end

  def self.getresourceaccountid
    if(resourceid.nil?)
      #Get All Resouces
      methodUri = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
      #Get the specific Resource
      methodUri = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(methodUri))
    return resp.body
  end
end