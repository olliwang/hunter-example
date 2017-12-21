Problem
-------

Boost 1.66 is still building `armv7` arch, and configuration checks look weird.

    Performing configuration checks

        - 32-bit                   : no
        - 64-bit                   : no
        - arm                      : no
        - mips1                    : no
        - power                    : no
        - sparc                    : no
        - x86                      : no
        - combined                 : no

Test Steps
----------

1. Removes the `.hunter` directory.
2. Building with `ios.cmake` toolchain as follow:

    cmake -H. -Bbuild -GXcode -DCMAKE_TOOLCHAIN_FILE=$POLLY_ROOT/ios.cmake


The build log is [here](Assets/Log.txt).