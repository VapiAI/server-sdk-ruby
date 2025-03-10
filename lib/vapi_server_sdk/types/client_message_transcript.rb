# frozen_string_literal: true

require_relative "client_message_transcript_type"
require_relative "client_message_transcript_role"
require_relative "client_message_transcript_transcript_type"
require "ostruct"
require "json"

module Vapi
  class ClientMessageTranscript
    # @return [Vapi::ClientMessageTranscriptType] This is the type of the message. "transcript" is sent as transcriber outputs
    #  partial or final transcript.
    attr_reader :type
    # @return [Vapi::ClientMessageTranscriptRole] This is the role for which the transcript is for.
    attr_reader :role
    # @return [Vapi::ClientMessageTranscriptTranscriptType] This is the type of the transcript.
    attr_reader :transcript_type
    # @return [String] This is the transcript content.
    attr_reader :transcript
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::ClientMessageTranscriptType] This is the type of the message. "transcript" is sent as transcriber outputs
    #  partial or final transcript.
    # @param role [Vapi::ClientMessageTranscriptRole] This is the role for which the transcript is for.
    # @param transcript_type [Vapi::ClientMessageTranscriptTranscriptType] This is the type of the transcript.
    # @param transcript [String] This is the transcript content.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientMessageTranscript]
    def initialize(type:, role:, transcript_type:, transcript:, additional_properties: nil)
      @type = type
      @role = role
      @transcript_type = transcript_type
      @transcript = transcript
      @additional_properties = additional_properties
      @_field_set = { "type": type, "role": role, "transcriptType": transcript_type, "transcript": transcript }
    end

    # Deserialize a JSON object to an instance of ClientMessageTranscript
    #
    # @param json_object [String]
    # @return [Vapi::ClientMessageTranscript]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      role = parsed_json["role"]
      transcript_type = parsed_json["transcriptType"]
      transcript = parsed_json["transcript"]
      new(
        type: type,
        role: role,
        transcript_type: transcript_type,
        transcript: transcript,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientMessageTranscript to a JSON object
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
      obj.type.is_a?(Vapi::ClientMessageTranscriptType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::ClientMessageTranscriptRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.transcript_type.is_a?(Vapi::ClientMessageTranscriptTranscriptType) != false || raise("Passed value for field obj.transcript_type is not the expected type, validation failed.")
      obj.transcript.is_a?(String) != false || raise("Passed value for field obj.transcript is not the expected type, validation failed.")
    end
  end
end
