# frozen_string_literal: true

class Checkout
  attr_accessor :params, :customer, :amount

  def initialize(amount, params)
    @params = params
    @customer = create_customer
    @amount = (amount * 100).to_i
    create_charge
  end

  def create_customer
    Stripe::Customer.create({
                              email: params[:stripeEmail],
                              source: params[:stripeToken]
                            })
  end

  def create_charge
    Stripe::Charge.create({
                            customer: customer.id,
                            amount: @amount,
                            description: 'Rails Stripe customer',
                            currency: 'usd'
                          })
  end
end
