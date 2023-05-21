#include <cstdint>

extern "C"
{
    int main()
    {
        return 0;
    }

    __attribute__((visibility("default"))) __attribute__((used)) 
    int add(int32_t value1, int32_t value2)
    {
        return value1 + value2;
    }
}