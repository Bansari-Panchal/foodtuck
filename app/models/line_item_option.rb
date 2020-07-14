class LineItemOption < ApplicationRecord
  belongs_to :option
  belongs_to :line_item
end
