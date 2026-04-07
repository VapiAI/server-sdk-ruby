# frozen_string_literal: true

module Vapi
  module Types
    class SchedulePlan < Internal::Types::Model
      field :earliest_at, -> { String }, optional: false, nullable: false, api_name: "earliestAt"
      field :latest_at, -> { String }, optional: true, nullable: false, api_name: "latestAt"
    end
  end
end
