# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardFacetsDto < Internal::Types::Model
      field :statuses, -> { Internal::Types::Array[Vapi::Types::CallHealthDashboardFacetsDtoStatusesItem] }, optional: false, nullable: false
    end
  end
end
