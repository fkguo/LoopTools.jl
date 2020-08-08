
# initialize LoopTools
function __init__()
    ccall((:ltini_, libooptools), Cvoid, ())
end
