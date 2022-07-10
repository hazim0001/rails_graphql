# frozen_string_literal: true

module Mutations
  class ItemCreate < BaseMutation
    description "Creates a new item"

    field :item, Types::ItemType, null: false

    argument :item_input, Types::ItemInputType, required: true

    def resolve(item_input:)
      item = ::Item.new(**item_input)
      raise GraphQL::ExecutionError.new "Error creating item", extensions: item.errors.to_hash unless item.save

      { item: item }
    end
  end
end
