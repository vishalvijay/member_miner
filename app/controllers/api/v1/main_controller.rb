class Api::V1::MainController < AppController

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

  def ethnicity_averages
    ethnicity = params[:ethnicity]
    if ethnicity.present?
      if Member::ETHNIC_GROUP.values.include?(ethnicity)
        members = Member.where ethnicity: ethnicity
        mean_height = members.sum(:height)/members.count
        mean_weight = members.sum(:weight)/members.count
        respond_with({mean_height: mean_height, mean_weight: mean_weight})
      else
        respond_errors "Unkown ethnicity", :not_found
      end
    else
      respond_errors "Required parameter missing", :not_acceptable
    end
  end
end