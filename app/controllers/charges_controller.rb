class ChargesController < ApplicationController
  protect_from_forgery :except => [:actual_charge]

  def new

  end

  def create_source

    source = Stripe::Source.create(
      type: "alipay",
      amount: "50",
      currency:'aud',
      redirect: {
        return_url: "#{request.base_url}/accepted_charge",
      },
    )
    redirect_to source[:redirect][:url]

  end

  def accepted_charge
  end

  def actual_charge

  Rails.logger.info(params)
  #client_secret = params[:client_secret]
  source = params[:data][:object][:id]


  charge = Stripe::Charge.create({
    amount: 50,
    currency: 'aud',
    source: source,
  })


  rescue => e
    # Some other error; display an error message.
    Rails.logger.info(e.message)
  
  end
end
