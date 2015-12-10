# encoding: utf-8

##
# Backup Generated: units_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t units_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Model.new(:units_backup, 'Description for units_backup') do

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "darasa_app_development"
    db.username           = "darasa"
    db.password           = "darasa"
    db.host               = "localhost"
    db.port               = 5432
    # db.socket             = "/tmp/pg.sock"
    # When dumping all databases, `skip_tables` and `only_tables` are ignored.
    # db.skip_tables        = ["skip", "these", "tables"]
    # db.only_tables        = ["only", "these", "tables"]
    db.only_tables        = ["questions"]
    db.additional_options = ["-xc", "-E=utf8"]
  end

  ##
  # SCP (Secure Copy) [Storage]
  #
  store_with SCP do |server|
    server.username   = "orinamokaya"
    server.password   = "cleftherintwain"
    server.ip         = "127.0.0.1"
    server.port       = 22
    server.path       = "~/backups/"
    server.keep       = 5
    # server.keep       = Time.now - 2592000 # Remove all backups older than 1 month.

    # Additional options for the SSH connection.
    # server.ssh_options = {}
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = "anyoksdenn@gmail.com"
    mail.to                   = "dennorina@gmail.com"
    mail.cc                   = "emaganjo@gmail.com"
    # mail.bcc                  = "bcc@email.com"
    # mail.reply_to             = "reply_to@email.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.domain               =  'smtp.gmail.com'#'google.com'#{}"localhost"#"your.host.name"
    mail.user_name            = "anyoksdenn@gmail.com"
    mail.password             = "sinnedmokaya"
    mail.authentication       =  :login #{}"plain" #:login#"plain"
    mail.encryption           =  :starttls #ssl
  end

end
