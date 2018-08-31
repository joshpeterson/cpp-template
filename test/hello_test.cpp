#include "catch.hpp"

#include "hello.h"
#include <iostream>

#include <sstream>

TEST_CASE("hello says hello")
{
  std::ostringstream out;
  std::streambuf* coutbuf = std::cout.rdbuf();

  std::cout.rdbuf(out.rdbuf()); // redirect cout to out
  hello("tester");
  hello("you");
  std::cout.rdbuf(coutbuf);

  REQUIRE(out.str() == "Hello, tester!\nHello, you!\n");
}
