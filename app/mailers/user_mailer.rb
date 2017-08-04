class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Jungle - Order ID: #{@order.id}")
  end
  
end
