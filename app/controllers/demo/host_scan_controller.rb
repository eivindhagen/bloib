class Demo::HostScanController < ApplicationController
  def index
    appDir = ::Rails.root.to_s
    @cmd = "ruby #{appDir}/scripts/host_scan.rb #{appDir}/hosts/Ubuntu-10.04 --test"
    @cmd = "echo #{appDir}/scripts/host_scan.rb"
    proc = IO.popen(@cmd)
    @pid = proc.pid
    @result = "R" + proc.readlines.join
    Process.waitpid(@pid)
    @status = $?
  end

end
