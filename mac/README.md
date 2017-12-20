PS. I removed the `.hunter` and the `build` directory before the `First Try`.

First try
----------

1. Testing without toolchain.
2. Executes

    cmake -H. -Bbuild -GXcode

Result:
Failed to compile the `yaml-cpp` package. Error log is [here](Assets/ErrorLog.txt)

Second try
----------

1. Testing with the `osx-10-13` toolchain.
2. Executes

    cmake -H. -Bbuild -GXcode -DCMAKE_TOOLCHAIN_FILE=$POLLY_ROOT/osx-10-13.cmake

Result:
Hunter builds succeeded.
