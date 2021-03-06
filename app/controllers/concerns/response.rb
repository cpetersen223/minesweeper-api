# Handling de response of all actions and set a default status
module Response
  def json_response(object,
                    status = :ok,
                    serializer: nil,
                    each_serializer: nil,
                    method: :render,
                    include: nil)

    send method,
         json: object,
         status: status,
         include: include,
         serializer: serializer,
         each_serializer: each_serializer
  end

  # Todo: Pagination for complete use of this method
  def paginated_json_response(object,
                              status = :ok,
                              serializer: nil,
                              each_serializer: nil,
                              method: :paginate)
    json_response object,
                  status,
                  serializer: serializer,
                  each_serializer: each_serializer,
                  method: method
  end
end