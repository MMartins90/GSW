class Contact < MailForm::Base
  attribute :full_name, :validate => true
  attribute :company_name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :contact_number, :validate => true
  attribute :message, :validate => true
  

  def headers
    {
      :to => "bradpfm@gmail.com",
      :subject => "Contact Request",
      :from => "bradpfm@gmail.com"
    }
  end
end
