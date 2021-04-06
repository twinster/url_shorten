class Url < ApplicationRecord
  validates_uniqueness_of :shorten
end
