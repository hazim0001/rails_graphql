# frozen_string_literal: true

class Mutations::UpdateArtist < Mutations::BaseMutation
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :email, String, required: false
  argument :id, Integer, required: true

  field :artist, Types::ArtistType, null: false
  field :errors, [String], null: false

  def resolve(id:, first_name:, last_name:, email:)
    artist = Artist.find(id)

    if artist.update(first_name: first_name, last_name: last_name, email: email)
      { artist: artist, errors: [] }
    else
      { artist: nil, errors: artist.errors.full_messages }
    end
  end
end
