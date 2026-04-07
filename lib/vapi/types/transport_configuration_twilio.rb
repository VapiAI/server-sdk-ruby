# frozen_string_literal: true

module Vapi
  module Types
    class TransportConfigurationTwilio < Internal::Types::Model
      field :provider, -> { Vapi::Types::TransportConfigurationTwilioProvider }, optional: false, nullable: false
      field :timeout, -> { Integer }, optional: true, nullable: false
      field :record, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :recording_channels, -> { Vapi::Types::TransportConfigurationTwilioRecordingChannels }, optional: true, nullable: false, api_name: "recordingChannels"
    end
  end
end
