#include <catch2/catch_test_macros.hpp>
#include <catch2/trompeloeil.hpp>

using trompeloeil::_;

class SessionMock
{
public:
    MAKE_MOCK0(testFn, void(void));
    MAKE_MOCK1(testFn2, void(int));
};


TEST_CASE("Test OK", "[Test]")
{
    SessionMock sessionMock;
    REQUIRE_CALL(sessionMock, testFn());

    sessionMock.testFn();
}

TEST_CASE("Test not OK", "[Test]")
{
    SessionMock sessionMock;
    REQUIRE_CALL(sessionMock, testFn());
}

TEST_CASE("Test not OK 2", "[Test]")
{
    SessionMock sessionMock;
    REQUIRE_CALL(sessionMock, testFn2(5));
    sessionMock.testFn2(5);
}

TEST_CASE("Test not OK 3", "[Test]")
{
    SessionMock sessionMock;
    REQUIRE_CALL(sessionMock, testFn2(5));
    sessionMock.testFn2(5);
}

TEST_CASE("Test OK 2", "[Test]")
{
    SessionMock sessionMock;
    REQUIRE_CALL(sessionMock, testFn2(_)).WITH(_1 == 3);
    sessionMock.testFn2(5);
}
