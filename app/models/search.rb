class Search < ActiveRecord::Base
  belongs_to :user

  def search_location
    search.try(:location)
  end

  def location_name=(name)
    self.location = Search.find_or_create_by(name) if name.present?
  end
end
