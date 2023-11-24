class PropertyCreationService
  def initialize(property)
    @property = property
  end
 
  def perform_some_action
    @property.update(furnishing: 'unfurnished')
  end

end