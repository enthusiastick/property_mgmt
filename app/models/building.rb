class Building < ActiveRecord::Base
  validates_presence_of :adress, :city, :state, :zip_code
end
