defmodule PersonalBase.EventApp do
  use Commanded.Application, otp_app: :personal_base

  router(PersonalBase.EventRouter)
end
