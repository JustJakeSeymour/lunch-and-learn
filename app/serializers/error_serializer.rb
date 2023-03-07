class ErrorSerializer
  def self.format(error)
    {
      "message": error.error_message,
      "code": error.code.to_s,
      "status": error.status
    }
  end
end