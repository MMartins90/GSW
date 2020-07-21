class Contact < MailForm::Base
  attribute :full_name, :validate => true
  attribute :company_name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :contact_number, :validate => true
  attribute :message, :validate => true
  

  def headers
    {
      :to => "marco_martins909@hotmail.co.uk",
      :subject => "Contact Request",
      :from => %("#{full_name}" <#{email}>)
    }
  end
end
