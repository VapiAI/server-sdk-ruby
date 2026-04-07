# frozen_string_literal: true

module Vapi
  module Types
    class RelayTargetAssistant < Internal::Types::Model
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant_name, -> { String }, optional: true, nullable: false, api_name: "assistantName"
    end
  end
end
