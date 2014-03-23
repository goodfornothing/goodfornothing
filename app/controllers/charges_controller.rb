class ChargesController < ApplicationController
  def new
  end

  def create
        
    @amount = params[:itemAmount]

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => params[:itemDescription],
      :currency    => 'GBP'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
