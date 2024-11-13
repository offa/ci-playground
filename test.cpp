#include <catch2/catch_test_macros.hpp>
#include <catch2/trompeloeil.hpp>

    class SessionMock
    {
    public:
        MAKE_MOCK0(testFn, void(void));
    };


    TEST_CASE("Test OK", "[Test]")
    {
        SessionMock sessionMock;
        REQUIRE_CALL(sessionMock, testFn());

        sessionMock.testFn();
    }
