#include <string>
#include <variant>
#include <iostream>
#include <sstream>

using FieldValue = std::variant<int, long long int, std::string, double, bool, unsigned int, unsigned long long int>;

template <class... Ts>
struct overloaded : Ts...
{
    using Ts::operator()...;
};

template <class... Ts>
overloaded(Ts...) -> overloaded<Ts...>;


void fn(FieldValue fv)
{
    std::stringstream convert;

    std::visit(overloaded{
            [&convert](int v)
            { convert << v << " i"; },
            [&convert](long long int v)
            { convert << v << " lli"; },
            [&convert](double v)
            { convert << v << " d"; },
            [&convert](const std::string& v)
            { convert << '"' << v << '"' << " str"; },
            [&convert](bool v)
            { convert << (v ? "true" : "false") << " b"; },
            [&convert](unsigned int v)
            { convert << v << " ui"; },
            [&convert](unsigned long long int v)
            { convert << v << " ulli"; },
            },
            fv);
    std::cout << fv.index() << ": " << convert.str() << "\n";
}

void fn(const char* str)
{
    fn(std::string{str});
}

int main()
{
    std::cout << "\n-------------\n";

    fn(3);
    fn(std::string{"abc"});
    fn(3.123);
    fn("def");
    fn(true);

    std::cout << "\n-------------\n";

    return 0;
}
