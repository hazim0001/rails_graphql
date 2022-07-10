# frozen_string_literal: true

module Mutations
  class ItemUpdate < BaseMutation
    description 'Updates a item by id'

    field :item, Types::ItemType, null: false

    argument :id, ID, required: true
    argument :item_input, Types::ItemInputType, required: true

    def resolve(id:, item_input:)
      item = ::Item.find(id)
      unless item.update(**item_input)
        raise GraphQL::ExecutionError.new 'Error updating item',
                                          extensions: item.errors.to_hash
      end

      { item: item }
    end
  end
end
