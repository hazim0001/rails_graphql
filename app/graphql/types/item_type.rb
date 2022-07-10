# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :image_url, String, null: true
    field :artist_id, Integer, null: false
    field :artist, Types::ArtistType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :is_original, Boolean, null: true

    def is_original
      current_artist = context[:current_artist]
      current_artist == object.artist
    end
  end
end
