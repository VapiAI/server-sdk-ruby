# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageEndOfCallReportCostsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::TransportCost }, key: "TRANSPORT"
      member -> { Vapi::Types::TranscriberCost }, key: "TRANSCRIBER"
      member -> { Vapi::Types::ModelCost }, key: "MODEL"
      member -> { Vapi::Types::VoiceCost }, key: "VOICE"
      member -> { Vapi::Types::VapiCost }, key: "VAPI"
      member -> { Vapi::Types::VoicemailDetectionCost }, key: "VOICEMAIL_DETECTION"
      member -> { Vapi::Types::AnalysisCost }, key: "ANALYSIS"
      member -> { Vapi::Types::KnowledgeBaseCost }, key: "KNOWLEDGE_BASE"
    end
  end
end
