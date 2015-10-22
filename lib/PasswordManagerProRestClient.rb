require 'net/http'
require 'json'
class PasswordManagerProRestClient
  attr_accessor :server
  attr_accessor :api_key
  attr_accessor :port
  attr_accessor :enable_insecure_ssl

  def initialize(server, api_key, port = 7272, enable_insecure_ssl = false)
    @server = server
    @api_key = api_key
    @port = port
    @base_server_uri = "https://" + @server + ":" + @port.to_s + "/restapi/json/v1/"
    @enable_insecure_ssl = enable_insecure_ssl
  end

  def self.get(uri_string)
    full_uri = "https://#{@baseserveruri}:#{@port}/restapi/json/v1/#{uri_string}&AUTHTOKEN=#{@api_key}"
    uri = URI.parse(full_uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    if(@enable_insecure_ssl)
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
    end
    return_val = http.get(uri.request_uri).body
    json_val = JSON.parse(return_val)
    if(json_val["operation"]["result"]["status"] == "Success")
      return json_val["operation"]["Details"]
    end
    throw :failure
  end

  def self.get_resource(resource_id)
    if(resource_id.nil?)
    #Get All Resouces
      methodUri = "resources?"
    else
    #Get the specific Resource
      methodUri = "resources/#{resource_id}?"
    end
    return self.get(methodUri)
  end

  def self.get_resource_account(resource_id, account_id)
    if(accountid.nil?)
      #Get All Resouces
      methodUri = "resources/#{resource_id}/accounts?"
    else
      #Get the specific Resource
      methodUri = "resources/#{resource_id}/accounts/#{account_id}?"
    end
    return self.get(methodUri)
  end

  def self.get_resource_account_password(resource_id, account_id)
    if(resourceid.is_a? String and accountid.is_a? String)
      #Fetch Based on Resource Names. Resolve IDs.
      resource_id, account_id = self.get_resource_account_id(resource_id,account_id)
    end
    methodUri = "resources/#{resource_id}/accounts/#{account_id}/password?"
    return self.get(methodUri)
  end

  def self.get_resource_account_id(resource_name, account_name)
    id_fetch = self.get("resources/resourcename/#{resource_name}/accounts/accountname/#{account_name}?")
    return id_fetch["RESOURCEID"].to_i, id_fetch["ACCOUNTID"].to_i
  end
end