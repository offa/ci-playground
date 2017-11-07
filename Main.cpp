#include <cstddef>
#include <cstdio>


#ifdef USE_COMPAT
# pragma message "* Compat *"

int main()
{
#ifndef USE_COMPAT
    std::byte b{7};
#else
    std::uint8_t b{7};
#endif /* USE_COMPAT */


    return 0;
}
