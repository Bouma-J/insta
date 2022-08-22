class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "E-mail de confirmation de demande"
  end
end
