class Order
  extend  ActiveModel::Naming
  extend  ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion

  def initialize(attributes={})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  attr_accessor :name, :title, :email, :company, :website, :tel, :boards_number, :process_node, :address


  def persisted?
    false
  end
end