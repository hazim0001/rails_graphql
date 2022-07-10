# frozen_string_literal: true

module Types
  class ItemInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :description, String, required: false
    argument :image_url, String, required: false
    argument :artist_id, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
