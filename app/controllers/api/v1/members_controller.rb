class Api::V1::MembersController < AppController

  def search_caption
    q = params[:query]
    if q.present?
      s = Sunspot.search(Member) do
        fulltext("\"#{q}\"^5 OR #{q}~1") do
          fields(caption: 5)
          phrase_fields(caption: 5)
        end
        paginate page: (params[:page]||1), per_page: (params[:limit]||25)
      end
      respond_with s.results
    else
      respond_errors "Required parameter missing", :not_acceptable
    end
  end

  def count
    respond_with({count: Member.count})
  end
end