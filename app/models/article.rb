class Article < ActiveRecord::Base
  scope :unarchived, -> { where(is_archived: [nil, false]) }
end
