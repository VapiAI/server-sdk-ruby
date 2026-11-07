# frozen_string_literal: true

module Vapi
  module Types
    class BoardMetricWidgetItem < Internal::Types::Model
      field :type, -> { Vapi::Types::BoardMetricWidgetItemType }, optional: false, nullable: false
      field :position, -> { Vapi::Types::BoardItemPosition }, optional: false, nullable: false
      field :size, -> { Vapi::Types::BoardItemSize }, optional: false, nullable: false
      field :insight_id, -> { String }, optional: true, nullable: false, api_name: "insightId"
      field :system_key, -> { String }, optional: true, nullable: false, api_name: "systemKey"
    end
  end
end
