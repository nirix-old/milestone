module VersionsHelper
  def version_status_options
    [
      [t(:active),     1],
      [t(:completed),  0],
      [t(:cancelled), -1]
    ]
  end
end
