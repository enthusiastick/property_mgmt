class Owner < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email
  has_many :buildings

  def name
    @name = self.first_name + ' ' + self.last_name
  end

  def buildingsowned
    if self.buildings.empty?
      []
    else
      self.buildings
    end
  end

end
