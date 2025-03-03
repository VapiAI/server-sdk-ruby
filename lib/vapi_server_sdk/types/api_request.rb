# frozen_string_literal: true

require_relative "api_request_method"
require_relative "json_schema"
require_relative "api_request_mode"
require_relative "hook"
require "ostruct"
require "json"

module Vapi
  class ApiRequest
    # @return [Vapi::ApiRequestMethod]
    attr_reader :method
    # @return [String] Api endpoint to send requests to.
    attr_reader :url
    # @return [Vapi::JsonSchema] These are the custom headers to include in the Api Request sent.
    #  Each key-value pair represents a header name and its value.
    attr_reader :headers
    # @return [Vapi::JsonSchema] This defined the JSON body of your Api Request. For example, if `body_schema`
    #  included "my_field": "my_gather_statement.user_age", then the json body sent to
    #  the server would have that particular value assign to it.
    #  Right now, only data from gather statements are supported.
    attr_reader :body
    # @return [Vapi::ApiRequestMode] This is the mode of the Api Request.
    #  We only support BLOCKING and BACKGROUND for now.
    attr_reader :mode
    # @return [Array<Vapi::Hook>] This is a list of hooks for a task.
    #  Each hook is a list of tasks to run on a trigger (such as on start, on failure,
    #  etc).
    #  Only Say is supported for now.
    attr_reader :hooks
    # @return [Vapi::JsonSchema] This is the schema for the outputs of the Api Request.
    attr_reader :output
    # @return [String]
    attr_reader :name
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param method [Vapi::ApiRequestMethod]
    # @param url [String] Api endpoint to send requests to.
    # @param headers [Vapi::JsonSchema] These are the custom headers to include in the Api Request sent.
    #  Each key-value pair represents a header name and its value.
    # @param body [Vapi::JsonSchema] This defined the JSON body of your Api Request. For example, if `body_schema`
    #  included "my_field": "my_gather_statement.user_age", then the json body sent to
    #  the server would have that particular value assign to it.
    #  Right now, only data from gather statements are supported.
    # @param mode [Vapi::ApiRequestMode] This is the mode of the Api Request.
    #  We only support BLOCKING and BACKGROUND for now.
    # @param hooks [Array<Vapi::Hook>] This is a list of hooks for a task.
    #  Each hook is a list of tasks to run on a trigger (such as on start, on failure,
    #  etc).
    #  Only Say is supported for now.
    # @param output [Vapi::JsonSchema] This is the schema for the outputs of the Api Request.
    # @param name [String]
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ApiRequest]
    def initialize(method:, url:, mode:, name:, headers: OMIT, body: OMIT, hooks: OMIT, output: OMIT, metadata: OMIT,
                   additional_properties: nil)
      @method = method
      @url = url
      @headers = headers if headers != OMIT
      @body = body if body != OMIT
      @mode = mode
      @hooks = hooks if hooks != OMIT
      @output = output if output != OMIT
      @name = name
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "method": method,
        "url": url,
        "headers": headers,
        "body": body,
        "mode": mode,
        "hooks": hooks,
        "output": output,
        "name": name,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ApiRequest
    #
    # @param json_object [String]
    # @return [Vapi::ApiRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      method = parsed_json["method"]
      url = parsed_json["url"]
      if parsed_json["headers"].nil?
        headers = nil
      else
        headers = parsed_json["headers"].to_json
        headers = Vapi::JsonSchema.from_json(json_object: headers)
      end
      if parsed_json["body"].nil?
        body = nil
      else
        body = parsed_json["body"].to_json
        body = Vapi::JsonSchema.from_json(json_object: body)
      end
      mode = parsed_json["mode"]
      hooks = parsed_json["hooks"]&.map do |item|
        item = item.to_json
        Vapi::Hook.from_json(json_object: item)
      end
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = Vapi::JsonSchema.from_json(json_object: output)
      end
      name = parsed_json["name"]
      metadata = parsed_json["metadata"]
      new(
        method: method,
        url: url,
        headers: headers,
        body: body,
        mode: mode,
        hooks: hooks,
        output: output,
        name: name,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of ApiRequest to a JSON object
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
      obj.method.is_a?(Vapi::ApiRequestMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.headers.nil? || Vapi::JsonSchema.validate_raw(obj: obj.headers)
      obj.body.nil? || Vapi::JsonSchema.validate_raw(obj: obj.body)
      obj.mode.is_a?(Vapi::ApiRequestMode) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
      obj.hooks&.is_a?(Array) != false || raise("Passed value for field obj.hooks is not the expected type, validation failed.")
      obj.output.nil? || Vapi::JsonSchema.validate_raw(obj: obj.output)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
