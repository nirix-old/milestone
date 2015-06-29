# Milestone
# Copyright 2013-2015 Jack Polgar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
