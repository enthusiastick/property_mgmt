class Building < ActiveRecord::Base
  validates_presence_of :address, :city, :state, :zip_code
  validates_numericality_of :zip_code
  belongs_to :owner
end
