module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :items, [Types::ItemType], null: false do
      argument :first, Integer, required: false
    end

    def items(_first:)
      first.positive? ? Item.limit(first) : Item.all
      # Item.limit(first)
    end

    field :artists, [Types::ArtistType], null: false
    def artists
      Artist.all
    end

    field :artist, Types::ArtistType, null: false do
      argument :id, ID, required: true
    end
    def artist(id:)
      Artist.find(id)
    end
  end
end
