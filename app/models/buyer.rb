class Buyer < ApplicationRecord
  belongs_to :history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
