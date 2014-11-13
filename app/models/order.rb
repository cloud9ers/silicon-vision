class Order
  extend  ActiveModel::Naming
  extend  ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :title, :email, :company, :website, :tel, :boards_number, :process_node, :address


  def persisted?
    false
  end
end