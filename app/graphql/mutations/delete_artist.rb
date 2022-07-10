# frozen_string_literal: true

class Mutations::DeleteArtist < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :artist, Types::ArtistType, null: false
  field :errors, [String], null: false

  def resolve(id:)
    artist = Artist.find(id)

    if artist.destroy
      { artist: artist, errors: [] }
    else
      { artist: nil, errors: artist.errors.full_messages }
    end
  end
end
