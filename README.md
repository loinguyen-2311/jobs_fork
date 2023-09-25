<!-- Command should remember -->
-`sudo /opt/lampp/lampp start`: Start lampp
- `Ctrl + '`'`: Open terminal in Visual code.


<!-- Production -->
+ git pull
+ rake assets:precompile
+ /etc/init.d/nginx restart

RAILS_ENV=production rake db:drop db:create db:migrate db:seed DISABLE_DATABASE_ENVIRONMENT_CHECK=1
RAILS_ENV=production rake users:create_users
RAILS_ENV=production rake jobs:create_jobs
RAILS_ENV=production rake employees:create_employees
RAILS_ENV=production rake credit_transactions:create_credit_transactions

rake db:drop db:create db:migrate db:seed users:create_users jobs:create_jobs employees:create_employees credit_transactions:create_credit_transactions

# Document for S3 with paperclip: https://devcenter.heroku.com/articles/paperclip-s3


# Run 2 command to fix
# Note Fix namesapce: "bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java"
# bundle lock --add-platform x86_64-linux

# Get page access token by user access token
# HTTParty.get("https://graph.facebook.com/964492397002271?fields=access_token&access_token=#{oauth_access_token}")

# Telegram Documentations
# Good documentation: https://www.youtube.com/watch?v=Pj8mwuMZZvg
# Telegram api docs: https://blog.corsego.com/ruby-on-rails-telegram-api-send-message


# Format Model in order

Write your codes in the correct section to make it clean and easy for reading

# == Extensions ===========================================================

# == Constants ============================================================

# == Attributes ===========================================================

# == Relationships ========================================================

# == Nested attributes ========================================================

# == Validations ==========================================================

# == Custom Validations ==========================================================

# == Scopes ===============================================================

# == Callbacks ============================================================

# == Methods ========================================================

# How to make telegram (Not using gem)
1. Access telegram, find bot: @BotFather
2. Type: "/newbot"
3. Type your bot name: "username_bot"
4. Get token: 6194068323:AAGJd4DNMjDd75OlAePshwjYiYwaATcMfGI
5. Create group add add "username_bot" to group
6. Get info: https://api.telegram.org/bot<token>/getUpdates
(If cant get info: Remove bot and reAdd bot)

text = "Test"
TELEGRAM_SEND_MESSAGE=https://api.telegram.org/bot<token>/sendMessage

send message: parsed_response = HTTParty.post(TELEGRAM_SEND_MESSAGE, body: { chat_id: '-1001842175925', text: text }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response

# admin info
# admin@devfinding.com|BinanceCoinX10000
