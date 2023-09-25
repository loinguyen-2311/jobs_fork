class Github::SendEmailService
  PUBLIC_EVENT = 'https://api.github.com/users/Saya221/events/public'

  # Authentication => Get followers/followings -> usernames -> scan email_address -> breake loop if enough 50 emails
  # -> send emails with SendGrid

  def username
    # Info: https://api.github.com/users/Saya221
  end

  def github_email
    # https://api.github.com/users/Saya221/events/public
  end
end

# Get username github, from username get email and job title after send email to marketing
