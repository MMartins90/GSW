class Apply < MailForm::Base
  attribute :full_name,      :validate => true
  attribute :location, :validate => true
  attribute :cover_letter,      :attachment => true
  attribute :cv,      :attachment => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Job application - #{full_name}",
      :to => "bradpfm@gmail.com",
      :from => %("#{full_name}" <#{email}>)
    }
  end
end
