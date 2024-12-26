# frozen_string_literal: true

require_relative "log_type"
require_relative "log_resource"
require_relative "log_request_http_method"
require_relative "error"
require "ostruct"
require "json"

module Vapi
  class Log
    # @return [String] This is the timestamp at which the log was written.
    attr_reader :time
    # @return [String] This is the unique identifier for the org that this log belongs to.
    attr_reader :org_id
    # @return [Vapi::LogType] This is the type of the log.
    attr_reader :type
    # @return [String] This is the type of the webhook, given the log is from a webhook.
    attr_reader :webhook_type
    # @return [Vapi::LogResource] This is the specific resource, relevant only to API logs.
    attr_reader :resource
    # @return [Float] 'This is how long the request took.
    attr_reader :request_duration_seconds
    # @return [String] This is the timestamp at which the request began.
    attr_reader :request_started_at
    # @return [String] This is the timestamp at which the request finished.
    attr_reader :request_finished_at
    # @return [Hash{String => Object}] This is the body of the request.
    attr_reader :request_body
    # @return [Vapi::LogRequestHttpMethod] This is the request method.
    attr_reader :request_http_method
    # @return [String] This is the request URL.
    attr_reader :request_url
    # @return [String] This is the request path.
    attr_reader :request_path
    # @return [String] This is the request query.
    attr_reader :request_query
    # @return [Float] This the HTTP status code of the response.
    attr_reader :response_http_code
    # @return [String] This is the request IP address.
    attr_reader :request_ip_address
    # @return [String] This is the origin of the request
    attr_reader :request_origin
    # @return [Hash{String => Object}] This is the body of the response.
    attr_reader :response_body
    # @return [Hash{String => Object}] These are the headers of the request.
    attr_reader :request_headers
    # @return [Vapi::Error] This is the error, if one occurred.
    attr_reader :error
    # @return [String] This is the ID of the assistant.
    attr_reader :assistant_id
    # @return [String] This is the ID of the phone number.
    attr_reader :phone_number_id
    # @return [String] This is the ID of the customer.
    attr_reader :customer_id
    # @return [String] This is the ID of the squad.
    attr_reader :squad_id
    # @return [String] This is the ID of the call.
    attr_reader :call_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param time [String] This is the timestamp at which the log was written.
    # @param org_id [String] This is the unique identifier for the org that this log belongs to.
    # @param type [Vapi::LogType] This is the type of the log.
    # @param webhook_type [String] This is the type of the webhook, given the log is from a webhook.
    # @param resource [Vapi::LogResource] This is the specific resource, relevant only to API logs.
    # @param request_duration_seconds [Float] 'This is how long the request took.
    # @param request_started_at [String] This is the timestamp at which the request began.
    # @param request_finished_at [String] This is the timestamp at which the request finished.
    # @param request_body [Hash{String => Object}] This is the body of the request.
    # @param request_http_method [Vapi::LogRequestHttpMethod] This is the request method.
    # @param request_url [String] This is the request URL.
    # @param request_path [String] This is the request path.
    # @param request_query [String] This is the request query.
    # @param response_http_code [Float] This the HTTP status code of the response.
    # @param request_ip_address [String] This is the request IP address.
    # @param request_origin [String] This is the origin of the request
    # @param response_body [Hash{String => Object}] This is the body of the response.
    # @param request_headers [Hash{String => Object}] These are the headers of the request.
    # @param error [Vapi::Error] This is the error, if one occurred.
    # @param assistant_id [String] This is the ID of the assistant.
    # @param phone_number_id [String] This is the ID of the phone number.
    # @param customer_id [String] This is the ID of the customer.
    # @param squad_id [String] This is the ID of the squad.
    # @param call_id [String] This is the ID of the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Log]
    def initialize(time:, org_id:, type:, request_duration_seconds:, request_started_at:, request_finished_at:,
                   request_body:, request_http_method:, request_url:, request_path:, response_http_code:, webhook_type: OMIT, resource: OMIT, request_query: OMIT, request_ip_address: OMIT, request_origin: OMIT, response_body: OMIT, request_headers: OMIT, error: OMIT, assistant_id: OMIT, phone_number_id: OMIT, customer_id: OMIT, squad_id: OMIT, call_id: OMIT, additional_properties: nil)
      @time = time
      @org_id = org_id
      @type = type
      @webhook_type = webhook_type if webhook_type != OMIT
      @resource = resource if resource != OMIT
      @request_duration_seconds = request_duration_seconds
      @request_started_at = request_started_at
      @request_finished_at = request_finished_at
      @request_body = request_body
      @request_http_method = request_http_method
      @request_url = request_url
      @request_path = request_path
      @request_query = request_query if request_query != OMIT
      @response_http_code = response_http_code
      @request_ip_address = request_ip_address if request_ip_address != OMIT
      @request_origin = request_origin if request_origin != OMIT
      @response_body = response_body if response_body != OMIT
      @request_headers = request_headers if request_headers != OMIT
      @error = error if error != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @call_id = call_id if call_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "time": time,
        "orgId": org_id,
        "type": type,
        "webhookType": webhook_type,
        "resource": resource,
        "requestDurationSeconds": request_duration_seconds,
        "requestStartedAt": request_started_at,
        "requestFinishedAt": request_finished_at,
        "requestBody": request_body,
        "requestHttpMethod": request_http_method,
        "requestUrl": request_url,
        "requestPath": request_path,
        "requestQuery": request_query,
        "responseHttpCode": response_http_code,
        "requestIpAddress": request_ip_address,
        "requestOrigin": request_origin,
        "responseBody": response_body,
        "requestHeaders": request_headers,
        "error": error,
        "assistantId": assistant_id,
        "phoneNumberId": phone_number_id,
        "customerId": customer_id,
        "squadId": squad_id,
        "callId": call_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Log
    #
    # @param json_object [String]
    # @return [Vapi::Log]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      time = parsed_json["time"]
      org_id = parsed_json["orgId"]
      type = parsed_json["type"]
      webhook_type = parsed_json["webhookType"]
      resource = parsed_json["resource"]
      request_duration_seconds = parsed_json["requestDurationSeconds"]
      request_started_at = parsed_json["requestStartedAt"]
      request_finished_at = parsed_json["requestFinishedAt"]
      request_body = parsed_json["requestBody"]
      request_http_method = parsed_json["requestHttpMethod"]
      request_url = parsed_json["requestUrl"]
      request_path = parsed_json["requestPath"]
      request_query = parsed_json["requestQuery"]
      response_http_code = parsed_json["responseHttpCode"]
      request_ip_address = parsed_json["requestIpAddress"]
      request_origin = parsed_json["requestOrigin"]
      response_body = parsed_json["responseBody"]
      request_headers = parsed_json["requestHeaders"]
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = Vapi::Error.from_json(json_object: error)
      end
      assistant_id = parsed_json["assistantId"]
      phone_number_id = parsed_json["phoneNumberId"]
      customer_id = parsed_json["customerId"]
      squad_id = parsed_json["squadId"]
      call_id = parsed_json["callId"]
      new(
        time: time,
        org_id: org_id,
        type: type,
        webhook_type: webhook_type,
        resource: resource,
        request_duration_seconds: request_duration_seconds,
        request_started_at: request_started_at,
        request_finished_at: request_finished_at,
        request_body: request_body,
        request_http_method: request_http_method,
        request_url: request_url,
        request_path: request_path,
        request_query: request_query,
        response_http_code: response_http_code,
        request_ip_address: request_ip_address,
        request_origin: request_origin,
        response_body: response_body,
        request_headers: request_headers,
        error: error,
        assistant_id: assistant_id,
        phone_number_id: phone_number_id,
        customer_id: customer_id,
        squad_id: squad_id,
        call_id: call_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of Log to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.time.is_a?(String) != false || raise("Passed value for field obj.time is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::LogType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.webhook_type&.is_a?(String) != false || raise("Passed value for field obj.webhook_type is not the expected type, validation failed.")
      obj.resource&.is_a?(Vapi::LogResource) != false || raise("Passed value for field obj.resource is not the expected type, validation failed.")
      obj.request_duration_seconds.is_a?(Float) != false || raise("Passed value for field obj.request_duration_seconds is not the expected type, validation failed.")
      obj.request_started_at.is_a?(String) != false || raise("Passed value for field obj.request_started_at is not the expected type, validation failed.")
      obj.request_finished_at.is_a?(String) != false || raise("Passed value for field obj.request_finished_at is not the expected type, validation failed.")
      obj.request_body.is_a?(Hash) != false || raise("Passed value for field obj.request_body is not the expected type, validation failed.")
      obj.request_http_method.is_a?(Vapi::LogRequestHttpMethod) != false || raise("Passed value for field obj.request_http_method is not the expected type, validation failed.")
      obj.request_url.is_a?(String) != false || raise("Passed value for field obj.request_url is not the expected type, validation failed.")
      obj.request_path.is_a?(String) != false || raise("Passed value for field obj.request_path is not the expected type, validation failed.")
      obj.request_query&.is_a?(String) != false || raise("Passed value for field obj.request_query is not the expected type, validation failed.")
      obj.response_http_code.is_a?(Float) != false || raise("Passed value for field obj.response_http_code is not the expected type, validation failed.")
      obj.request_ip_address&.is_a?(String) != false || raise("Passed value for field obj.request_ip_address is not the expected type, validation failed.")
      obj.request_origin&.is_a?(String) != false || raise("Passed value for field obj.request_origin is not the expected type, validation failed.")
      obj.response_body&.is_a?(Hash) != false || raise("Passed value for field obj.response_body is not the expected type, validation failed.")
      obj.request_headers&.is_a?(Hash) != false || raise("Passed value for field obj.request_headers is not the expected type, validation failed.")
      obj.error.nil? || Vapi::Error.validate_raw(obj: obj.error)
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.call_id&.is_a?(String) != false || raise("Passed value for field obj.call_id is not the expected type, validation failed.")
    end
  end
end
