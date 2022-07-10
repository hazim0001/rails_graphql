# frozen_string_literal: true

module Mutations
  class ItemDelete < BaseMutation
    description 'Deletes a item by ID'

    field :item, Types::ItemType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      item = ::Item.find(id)
      raise GraphQL::ExecutionError.new 'Error deleting item', extensions: item.errors.to_hash unless item.destroy

      { item: item }
    end
  end
end
