class ChargesController < ApplicationController
  def new
  end

  def create
        
    @amount = params[:itemAmount]
    @gig = Gig.find(params[:gigID]);

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
    
  AdminMailer.made_payment.deliver    
        
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
