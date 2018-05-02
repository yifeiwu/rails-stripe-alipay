class ChargesController < ApplicationController
  protect_from_forgery except: [:actual_charge]

  def new; end

  def create_source
    source = Stripe::Source.create(
      type: 'alipay',
      amount: '5000',
      currency: 'aud',
      redirect: {
        # where to go after charge is accepted by customer
        return_url: "#{request.base_url}/accepted_charge"
      }
    )
    # stripe generated qr code for customer to scan
    redirect_to source[:redirect][:url]
  end

  def accepted_charge; end

  def actual_charge
    source = params.dig(:data, :object, :id)

    charge = Stripe::Charge.create(
      amount: 5000,
      currency: 'aud',
      source: source
    )
  rescue StandardError => e
    # Some error; display an error message.
    Rails.logger.info(e.message)
  end
end
