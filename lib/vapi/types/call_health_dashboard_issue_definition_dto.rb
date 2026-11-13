# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueDefinitionDto < Internal::Types::Model
      field :applicability, -> { String }, optional: false, nullable: true
      field :problem, -> { String }, optional: false, nullable: true
      field :created_taxonomy_version, -> { Integer }, optional: false, nullable: true, api_name: "createdTaxonomyVersion"
    end
  end
end
