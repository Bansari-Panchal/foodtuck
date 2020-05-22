class Option < ApplicationRecord
  belongs_to :choice ,optional: true
end
