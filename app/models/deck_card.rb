class DeckCard < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card

  validates_presence_of :deck_id, :card_id
end
