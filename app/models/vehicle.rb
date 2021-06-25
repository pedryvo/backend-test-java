class Vehicle < ApplicationRecord
  enum kind: [:car, :motorcycle]
end
