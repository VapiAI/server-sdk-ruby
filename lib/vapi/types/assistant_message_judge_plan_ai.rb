# frozen_string_literal: true

module Vapi
  module Types
    class AssistantMessageJudgePlanAi < Internal::Types::Model
      field :model, -> { Vapi::Types::AssistantMessageJudgePlanAiModel }, optional: false, nullable: false
      field :type, -> { Vapi::Types::AssistantMessageJudgePlanAiType }, optional: false, nullable: false
      field :auto_include_message_history, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoIncludeMessageHistory"
    end
  end
end
