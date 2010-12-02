class Demo::HostScanController < ApplicationController
  def index
    appDir = ::Rails.root.to_s
    @cmd = "ruby #{appDir}/script/host_scan.rb #{appDir}/hosts/Ubuntu-10.04 --test"
    proc = IO.popen(@cmd)
    @pid = proc.pid
    @result = proc.readlines.join
    Process.waitpid(@pid)
    @status = $?
  end

end
