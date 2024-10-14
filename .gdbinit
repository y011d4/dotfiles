set debuginfod enabled on
source /home/y011d4/ghq/github.com/pwndbg/pwndbg/gdbinit.py
source ~/ghq/github.com/scwuaptx/Pwngdb/pwngdb.py
source ~/ghq/github.com/scwuaptx/Pwngdb/angelheap/gdbinit.py

define hook-run
python
import angelheap
angelheap.init_angelheap()
end
end

set startup-with-shell off
