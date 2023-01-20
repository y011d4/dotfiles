# yay pwndbg (https://github.com/pwndbg/pwndbg)
source /usr/share/pwndbg/gdbinit.py
# ghq get https://github.com/scwuaptx/Pwngdb.git
source ~/ghq/github.com/scwuaptx/Pwngdb/pwngdb.py
source ~/ghq/github.com/scwuaptx/Pwngdb/angelheap/gdbinit.py

define hook-run
python
import angelheap
angelheap.init_angelheap()
end
end

set startup-with-shell off
