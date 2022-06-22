class CartSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:created_at,:updated_at,:cart_items
  def cart_items
    customized_estimates = []
    object.cart_items.each do |estimate|
      # Assign object attributes (returns a hash)
      # ===========================================================
      custom_estimate = estimate.attributes


      # Custom nested and side-loaded attributes
      # ===========================================================
      # belongs_to
      custom_estimate[:product] = estimate.product # get only :id and :name for the project
      #custom_estimate[:project_code] = estimate.project_code
     # custom_estimate[:tax_type] = estimate.tax_type

      # has_many w/only specified attributes
      #custom_estimate[:proposals] = estimate.proposals.collect{|proposal| proposal.slice(:id, :name, :updated_at)}

      # ===========================================================
      customized_estimates.push(custom_estimate)
    end

    return customized_estimates
  end
  # has_many :cart_items do
  #   belongs: product
end
