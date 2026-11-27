# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAssistantReferenceDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :latest_version, -> { String }, optional: true, nullable: false, api_name: "latestVersion"
    end
  end
end
