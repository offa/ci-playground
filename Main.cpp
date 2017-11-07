#include <cstddef>
#include <cstdint>


#ifdef USE_COMPAT
# pragma message "* Compat *"
#endif /* USE_COMPAT */

int main()
{
#ifndef USE_COMPAT
    std::byte b{7};
#else
    std::uint8_t b{7};
#endif /* USE_COMPAT */


    return 0;
}
