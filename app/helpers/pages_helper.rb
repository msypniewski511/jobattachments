module PagesHelper

  def created_at job
    DateTime.parse(job).strftime("%d-%m-%Y")
  end

  def job_location job
    job['location']['display_name'] || job['location']
  end


  def company_name job
    job['company']['display_name'] || job['company']
  end

  def link_to_details job
    return link_to 'View & apply', job['redirect_url'], class: 'btn btn-primary btn-block' if job['redirect_url']
    return link_to 'View & apply', show_job_path(job['id']), class: 'btn btn-primary btn-block' if job['id']
    
  end
end
