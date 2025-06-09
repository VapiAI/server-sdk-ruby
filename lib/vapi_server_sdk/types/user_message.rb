# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class UserMessage
  # @return [String] The role of the user in the conversation.
    attr_reader :role
  # @return [String] The message content from the user.
    attr_reader :message
  # @return [Float] The timestamp when the message was sent.
    attr_reader :time
  # @return [Float] The timestamp when the message ended.
    attr_reader :end_time
  # @return [Float] The number of seconds from the start of the conversation.
    attr_reader :seconds_from_start
  # @return [Float] The duration of the message in seconds.
    attr_reader :duration
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [String] The role of the user in the conversation.
    # @param message [String] The message content from the user.
    # @param time [Float] The timestamp when the message was sent.
    # @param end_time [Float] The timestamp when the message ended.
    # @param seconds_from_start [Float] The number of seconds from the start of the conversation.
    # @param duration [Float] The duration of the message in seconds.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UserMessage]
    def initialize(role:, message:, time:, end_time:, seconds_from_start:, duration: OMIT, additional_properties: nil)
      @role = role
      @message = message
      @time = time
      @end_time = end_time
      @seconds_from_start = seconds_from_start
      @duration = duration if duration != OMIT
      @additional_properties = additional_properties
      @_field_set = { "role": role, "message": message, "time": time, "endTime": end_time, "secondsFromStart": seconds_from_start, "duration": duration }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UserMessage
    #
    # @param json_object [String] 
    # @return [Vapi::UserMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      message = parsed_json["message"]
      time = parsed_json["time"]
      end_time = parsed_json["endTime"]
      seconds_from_start = parsed_json["secondsFromStart"]
      duration = parsed_json["duration"]
      new(
        role: role,
        message: message,
        time: time,
        end_time: end_time,
        seconds_from_start: seconds_from_start,
        duration: duration,
        additional_properties: struct
      )
    end
# Serialize an instance of UserMessage to a JSON object
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
      obj.role.is_a?(String) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.time.is_a?(Float) != false || raise("Passed value for field obj.time is not the expected type, validation failed.")
      obj.end_time.is_a?(Float) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
      obj.seconds_from_start.is_a?(Float) != false || raise("Passed value for field obj.seconds_from_start is not the expected type, validation failed.")
      obj.duration&.is_a?(Float) != false || raise("Passed value for field obj.duration is not the expected type, validation failed.")
    end
  end
end