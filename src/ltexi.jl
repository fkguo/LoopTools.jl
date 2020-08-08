"""
    ltexi()

summary of errors
"""
ltexi() = ccall((:ltexi_, libooptools), Cvoid, ())
