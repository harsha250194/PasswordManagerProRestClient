
class PasswordManagerProRestClient

  def initialize(server, apikey, port, enableinsecuressl)
    @server = server
    @apikey = apikey
    @port = port
    @baseserveruri = "https://" + server + ":" + port + "/restapi/json/v1/"
    @enableinsecuressl = enableinsecuressl
  end

  def self.getresource(resourceid)
    if(resourceid.nil?)
    #Get All Resouces
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
    #Get the specific Resource
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(getResourceurl))
    return resp.body
  end

  def self.getresourceaccount
    if(resourceid.nil?)
      #Get All Resouces
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
      #Get the specific Resource
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(getResourceurl))
    return resp.body
  end

  def self.getresourceaccountpassword
    if(resourceid.nil?)
      #Get All Resouces
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
      #Get the specific Resource
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(getResourceurl))
    return resp.body
  end

  def self.getresourceid
    if(resourceid.nil?)
      #Get All Resouces
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
      #Get the specific Resource
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(getResourceurl))
    return resp.body
  end

  def self.getresourceaccountid
    if(resourceid.nil?)
      #Get All Resouces
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources?AUTHTOKEN=#{@apikey}"
    else
      #Get the specific Resource
      getResourceurl = "https://<Host-Name-of-PMP-Server OR IP address>:7272/restapi/json /v1/resources/<Resource ID>"
    end
    resp = Net::HTTP.get_response(URI.parse(getResourceurl))
    return resp.body
  end
end