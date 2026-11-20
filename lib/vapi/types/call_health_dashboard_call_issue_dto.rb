# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardCallIssueDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :status, -> { Vapi::Types::CallHealthDashboardCallIssueDtoStatus }, optional: false, nullable: false
      field :row_version, -> { Integer }, optional: false, nullable: false, api_name: "rowVersion"
      field :category_key, -> { String }, optional: false, nullable: false, api_name: "categoryKey"
    end
  end
end
