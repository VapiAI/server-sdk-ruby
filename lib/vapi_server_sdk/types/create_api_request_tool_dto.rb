# frozen_string_literal: true
require_relative "create_api_request_tool_dto_messages_item"
require_relative "create_api_request_tool_dto_method"
require_relative "json_schema"
require_relative "backoff_plan"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class CreateApiRequestToolDto
  # @return [Array<Vapi::CreateApiRequestToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    attr_reader :messages
  # @return [Vapi::CreateApiRequestToolDtoMethod] 
    attr_reader :method
  # @return [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
#  @default 20
    attr_reader :timeout_seconds
  # @return [String] This is the name of the tool. This will be passed to the model.
    attr_reader :name
  # @return [String] This is the description of the tool. This will be passed to the model.
    attr_reader :description
  # @return [String] This is where the request will be sent.
    attr_reader :url
  # @return [Vapi::JsonSchema] This is the body of the request.
    attr_reader :body
  # @return [Vapi::JsonSchema] These are the headers to send in the request.
    attr_reader :headers
  # @return [Vapi::BackoffPlan] This is the backoff plan if the request fails. Defaults to undefined (the
#  request will not be retried).
#  @default undefined (the request will not be retried)
    attr_reader :backoff_plan
  # @return [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    attr_reader :function
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::CreateApiRequestToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    # @param method [Vapi::CreateApiRequestToolDtoMethod] 
    # @param timeout_seconds [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
#  @default 20
    # @param name [String] This is the name of the tool. This will be passed to the model.
    # @param description [String] This is the description of the tool. This will be passed to the model.
    # @param url [String] This is where the request will be sent.
    # @param body [Vapi::JsonSchema] This is the body of the request.
    # @param headers [Vapi::JsonSchema] These are the headers to send in the request.
    # @param backoff_plan [Vapi::BackoffPlan] This is the backoff plan if the request fails. Defaults to undefined (the
#  request will not be retried).
#  @default undefined (the request will not be retried)
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateApiRequestToolDto]
    def initialize(messages: OMIT, method:, timeout_seconds: OMIT, name: OMIT, description: OMIT, url:, body: OMIT, headers: OMIT, backoff_plan: OMIT, function: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @method = method
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @url = url
      @body = body if body != OMIT
      @headers = headers if headers != OMIT
      @backoff_plan = backoff_plan if backoff_plan != OMIT
      @function = function if function != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "method": method, "timeoutSeconds": timeout_seconds, "name": name, "description": description, "url": url, "body": body, "headers": headers, "backoffPlan": backoff_plan, "function": function }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateApiRequestToolDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateApiRequestToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::CreateApiRequestToolDtoMessagesItem.from_json(json_object: item)
end
      method = parsed_json["method"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      url = parsed_json["url"]
      unless parsed_json["body"].nil?
        body = parsed_json["body"].to_json
        body = Vapi::JsonSchema.from_json(json_object: body)
      else
        body = nil
      end
      unless parsed_json["headers"].nil?
        headers = parsed_json["headers"].to_json
        headers = Vapi::JsonSchema.from_json(json_object: headers)
      else
        headers = nil
      end
      unless parsed_json["backoffPlan"].nil?
        backoff_plan = parsed_json["backoffPlan"].to_json
        backoff_plan = Vapi::BackoffPlan.from_json(json_object: backoff_plan)
      else
        backoff_plan = nil
      end
      unless parsed_json["function"].nil?
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      else
        function = nil
      end
      new(
        messages: messages,
        method: method,
        timeout_seconds: timeout_seconds,
        name: name,
        description: description,
        url: url,
        body: body,
        headers: headers,
        backoff_plan: backoff_plan,
        function: function,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateApiRequestToolDto to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.method.is_a?(Vapi::CreateApiRequestToolDtoMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.body.nil? || Vapi::JsonSchema.validate_raw(obj: obj.body)
      obj.headers.nil? || Vapi::JsonSchema.validate_raw(obj: obj.headers)
      obj.backoff_plan.nil? || Vapi::BackoffPlan.validate_raw(obj: obj.backoff_plan)
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
    end
  end
end