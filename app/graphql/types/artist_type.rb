# frozen_string_literal: true

module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :full_name, String, null: true
    field :items, [Types::ItemType], null: false
    field :items_count, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def full_name
      [object.first_name, object.last_name].compact.join('')
    end

    def items_count
      object.items.size
    end

    def items
      context.scoped_set!(:current_artist, object)
      object.items
    end
  end
end
