# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiReasonerSkill < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
      field :tools, -> { Internal::Types::Array[Vapi::Types::OpenAiReasonerSkillToolsItem] }, optional: true, nullable: false
      field :tool_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "toolIds"
    end
  end
end
