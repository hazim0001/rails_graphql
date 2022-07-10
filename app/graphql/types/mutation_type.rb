module Types
  class MutationType < Types::BaseObject
    field :item_update, mutation: Mutations::ItemUpdate
    field :item_delete, mutation: Mutations::ItemDelete
    field :item_create, mutation: Mutations::ItemCreate
    field :create_artist, mutation: Mutations::CreateArtist
    field :delete_artist, mutation: Mutations::DeleteArtist
    field :update_artist, mutation: Mutations::UpdateArtist
  end
end
