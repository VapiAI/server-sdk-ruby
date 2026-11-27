# frozen_string_literal: true

module Vapi
  module Types
    module CallArtifactUploadItemType
      extend Vapi::Internal::Types::Enum

      END_OF_CALL_REPORT = "end-of-call-report"
      RECORDING_MONO = "recording-mono"
      RECORDING_STEREO = "recording-stereo"
      RECORDING_ASSISTANT = "recording-assistant"
      RECORDING_CUSTOMER = "recording-customer"
      LOG = "log"
      PCAP = "pcap"
    end
  end
end
