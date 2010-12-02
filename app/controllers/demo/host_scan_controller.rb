class Demo::HostScanController < ApplicationController
  def index
    appDir = ::Rails.root.to_s
    @cmd = "cat /root/rwb_bot/tmp/cron/host_scan"
    proc = IO.popen(@cmd)
    @pid = proc.pid
    @result = proc.readlines.join
    Process.waitpid(@pid)
    @status = $?
  end

end
