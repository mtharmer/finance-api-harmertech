# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@harmertech.com'
  layout 'mailer'
end
