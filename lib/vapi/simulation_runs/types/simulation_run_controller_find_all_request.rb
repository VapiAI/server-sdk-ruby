# frozen_string_literal: true

module Vapi
  module SimulationRuns
    module Types
      class SimulationRunControllerFindAllRequest < Internal::Types::Model
        field :status, -> { Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestStatus }, optional: true, nullable: false
        field :filter_status, -> { Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestFilterStatus }, optional: true, nullable: false, api_name: "filterStatus"
        field :target_type, -> { Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestTargetType }, optional: true, nullable: false, api_name: "targetType"
        field :target_id, -> { String }, optional: true, nullable: false, api_name: "targetId"
        field :page, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
        field :sort_by, -> { Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestSortBy }, optional: true, nullable: false, api_name: "sortBy"
        field :limit, -> { Integer }, optional: true, nullable: false
        field :created_at_gt, -> { String }, optional: true, nullable: false, api_name: "createdAtGt"
        field :created_at_lt, -> { String }, optional: true, nullable: false, api_name: "createdAtLt"
        field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
        field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
        field :updated_at_gt, -> { String }, optional: true, nullable: false, api_name: "updatedAtGt"
        field :updated_at_lt, -> { String }, optional: true, nullable: false, api_name: "updatedAtLt"
        field :updated_at_ge, -> { String }, optional: true, nullable: false, api_name: "updatedAtGe"
        field :updated_at_le, -> { String }, optional: true, nullable: false, api_name: "updatedAtLe"
      end
    end
  end
end
