# frozen_string_literal: true

module Vapi
# This is the type of output you'd like.
#  `string`, `number`, `integer`, `boolean` are the primitive types and should be
#  obvious.
#  `array` and `object` are more interesting and quite powerful. They allow you to
#  define nested structures.
#  For `array`, you can define the schema of the items in the array using the
#  `items` property.
#  For `object`, you can define the properties of the object using the `properties`
#  property.
  class JsonSchemaType

    STRING = "string"
    NUMBER = "number"
    INTEGER = "integer"
    BOOLEAN = "boolean"
    ARRAY = "array"
    OBJECT = "object"

  end
end