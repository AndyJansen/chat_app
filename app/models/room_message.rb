class RoomMessage < ApplicationRecord
  require 'obscenity/active_model'

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  validates :message,  obscenity: { sanitize: true, replacement: :vowels }
  
  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end
  
end
