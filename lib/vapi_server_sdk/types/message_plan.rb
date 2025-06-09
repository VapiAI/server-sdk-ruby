# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class MessagePlan
  # @return [Array<String>] This are the messages that the assistant will speak when the user hasn't
#  responded for `idleTimeoutSeconds`. Each time the timeout is triggered, a random
#  message will be chosen from this array.
#  Usage:
#  - If user gets distracted and doesn't respond for a while, this can be used to
#  grab their attention.
#  - If the transcriber doesn't pick up what the user said, this can be used to ask
#  the user to repeat themselves. (From the perspective of the assistant, the
#  conversation is idle since it didn't "hear" any user messages.)
#  @default null (no idle message is spoken)
    attr_reader :idle_messages
  # @return [Float] This determines the maximum number of times `idleMessages` can be spoken during
#  the call.
#  @default 3
    attr_reader :idle_message_max_spoken_count
  # @return [Boolean] This determines whether the idle message count is reset whenever the user
#  speaks.
#  @default false
    attr_reader :idle_message_reset_count_on_user_speech_enabled
  # @return [Float] This is the timeout in seconds before a message from `idleMessages` is spoken.
#  The clock starts when the assistant finishes speaking and remains active until
#  the user speaks.
#  @default 10
    attr_reader :idle_timeout_seconds
  # @return [String] This is the message that the assistant will say if the call ends due to silence.
#  If unspecified, it will hang up without saying anything.
    attr_reader :silence_timeout_message
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idle_messages [Array<String>] This are the messages that the assistant will speak when the user hasn't
#  responded for `idleTimeoutSeconds`. Each time the timeout is triggered, a random
#  message will be chosen from this array.
#  Usage:
#  - If user gets distracted and doesn't respond for a while, this can be used to
#  grab their attention.
#  - If the transcriber doesn't pick up what the user said, this can be used to ask
#  the user to repeat themselves. (From the perspective of the assistant, the
#  conversation is idle since it didn't "hear" any user messages.)
#  @default null (no idle message is spoken)
    # @param idle_message_max_spoken_count [Float] This determines the maximum number of times `idleMessages` can be spoken during
#  the call.
#  @default 3
    # @param idle_message_reset_count_on_user_speech_enabled [Boolean] This determines whether the idle message count is reset whenever the user
#  speaks.
#  @default false
    # @param idle_timeout_seconds [Float] This is the timeout in seconds before a message from `idleMessages` is spoken.
#  The clock starts when the assistant finishes speaking and remains active until
#  the user speaks.
#  @default 10
    # @param silence_timeout_message [String] This is the message that the assistant will say if the call ends due to silence.
#  If unspecified, it will hang up without saying anything.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::MessagePlan]
    def initialize(idle_messages: OMIT, idle_message_max_spoken_count: OMIT, idle_message_reset_count_on_user_speech_enabled: OMIT, idle_timeout_seconds: OMIT, silence_timeout_message: OMIT, additional_properties: nil)
      @idle_messages = idle_messages if idle_messages != OMIT
      @idle_message_max_spoken_count = idle_message_max_spoken_count if idle_message_max_spoken_count != OMIT
      @idle_message_reset_count_on_user_speech_enabled = idle_message_reset_count_on_user_speech_enabled if idle_message_reset_count_on_user_speech_enabled != OMIT
      @idle_timeout_seconds = idle_timeout_seconds if idle_timeout_seconds != OMIT
      @silence_timeout_message = silence_timeout_message if silence_timeout_message != OMIT
      @additional_properties = additional_properties
      @_field_set = { "idleMessages": idle_messages, "idleMessageMaxSpokenCount": idle_message_max_spoken_count, "idleMessageResetCountOnUserSpeechEnabled": idle_message_reset_count_on_user_speech_enabled, "idleTimeoutSeconds": idle_timeout_seconds, "silenceTimeoutMessage": silence_timeout_message }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MessagePlan
    #
    # @param json_object [String] 
    # @return [Vapi::MessagePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idle_messages = parsed_json["idleMessages"]
      idle_message_max_spoken_count = parsed_json["idleMessageMaxSpokenCount"]
      idle_message_reset_count_on_user_speech_enabled = parsed_json["idleMessageResetCountOnUserSpeechEnabled"]
      idle_timeout_seconds = parsed_json["idleTimeoutSeconds"]
      silence_timeout_message = parsed_json["silenceTimeoutMessage"]
      new(
        idle_messages: idle_messages,
        idle_message_max_spoken_count: idle_message_max_spoken_count,
        idle_message_reset_count_on_user_speech_enabled: idle_message_reset_count_on_user_speech_enabled,
        idle_timeout_seconds: idle_timeout_seconds,
        silence_timeout_message: silence_timeout_message,
        additional_properties: struct
      )
    end
# Serialize an instance of MessagePlan to a JSON object
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
      obj.idle_messages&.is_a?(Array) != false || raise("Passed value for field obj.idle_messages is not the expected type, validation failed.")
      obj.idle_message_max_spoken_count&.is_a?(Float) != false || raise("Passed value for field obj.idle_message_max_spoken_count is not the expected type, validation failed.")
      obj.idle_message_reset_count_on_user_speech_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.idle_message_reset_count_on_user_speech_enabled is not the expected type, validation failed.")
      obj.idle_timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.idle_timeout_seconds is not the expected type, validation failed.")
      obj.silence_timeout_message&.is_a?(String) != false || raise("Passed value for field obj.silence_timeout_message is not the expected type, validation failed.")
    end
  end
end