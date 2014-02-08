module VersionsHelper
  def version_statuses
    {
      1  => t(:active),
      0  => t(:completed),
      -1 => t(:cancelled)
    }
  end

  def version_status_options
    options = []

    version_statuses.each do |id, status|
      options.push [status, id]
    end

    options
  end

  def version_status(status_id)
    version_statuses[status_id]
  end
end
