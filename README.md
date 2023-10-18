# Rails app for finding jobs 
Jobs web - https://devfinding.com/

# How to run
* RAILS_ENV=production rake db:drop db:create db:migrate db:seed DISABLE_DATABASE_ENVIRONMENT_CHECK=1
* RAILS_ENV=production rake users:create_users
* RAILS_ENV=production rake jobs:create_jobs
* RAILS_ENV=production rake employees:create_employees
* RAILS_ENV=production rake credit_transactions:create_credit_transactions
* rake db:drop db:create db:migrate db:seed users:create_users jobs:create_jobs employees:create_employees credit_transactions:create_credit_transactions

## Telegram Documentations
* Follow: https://www.youtube.com/watch?v=Pj8mwuMZZvg
* Telegram api docs: https://blog.corsego.com/ruby-on-rails-telegram-api-send-message

## How to make telegram (Not using gem)
1. Access telegram, find bot: @BotFather
2. Type: "/newbot"
3. Type your bot name: "username_bot"
4. Get token: {}
5. Create group add add "username_bot" to group
6. Get info: https://api.telegram.org/bot<token>/getUpdates
(If cant get info: Remove bot and reAdd bot)

text = "Test"
TELEGRAM_SEND_MESSAGE=https://api.telegram.org/bot<token>/sendMessage

send message: parsed_response = HTTParty.post(TELEGRAM_SEND_MESSAGE, body: { chat_id: '-1001842175925', text: text }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response

You can view my deployment of this application [here](https://devfinding.com/) (it may take sometime to load if the server is sleep, because it 's free) , or you can use the button below to deploy your own version.

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

To view an implementation of this project, check out this [repo](https://github.com/rubyhcm/jobs)

