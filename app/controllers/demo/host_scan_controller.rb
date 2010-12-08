class Demo::HostScanController < ApplicationController
  def index
    cron_rwb_root = HostSetting.find_by_key 'cron_rwb_root'
    if cron_rwb_root.nil? || cron_rwb_root.value.empty? 
      root = ::Rails.root.to_s
    else
      root = cron_rwb_root.value
    end
  
    @cmd = "cat #{root}/tmp/cron/host_scan"
    proc = IO.popen(@cmd)
    @pid = proc.pid
    @result = proc.readlines.join
    Process.waitpid(@pid)
    @status = $?
  end
end
